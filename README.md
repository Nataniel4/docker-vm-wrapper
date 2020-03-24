# Docker VM Wrapper
Use docker from a VM (using SSH) in your host machine as if were locally installed.

## Installation
Just add the files and folders from `Release` folder into the `/usr/local/bin` directory of you host system and set the ENV vars into your bash profile.
```sh
cp -r Release/. /usr/local/bin
```

## ENV Vars
- `VM_WRAPPER_SSH` **(required)**: The ssh connection in **user@domain** format. Example: `johndoe@localhost`

- `VM_WRAPPER_GUEST_PATH` **(optional)**:
	-	Normally the VMs has a limited access to host FS, this ENV sets the base path of the docker commands execution inside your VM. Example: if you set this ENV to `/my/shared/folder` and you call docker from `/path/to/somewhere/my-dir` the docker command will `cd` into the path `/my/shared/folder/my-dir` inside the VM then run the docker command.
	- By default uses the real CWD of your execution.

- `VM_WRAPPER_HOST_PATH` **(optional)**:
	-	The host path that you want to replace by the guest path inside the VM.
	- Combined with `DOCKER_VM_GUEST_PATH` can map host directories into the VM. Example: With host path as `'/Volumes/MyVolume'` and guest path as `'/my/shared/folder'` when you execute a docker command from a CWD like `'/Volumes/MyVolume/myDir/myFiles'`, inside the VM will be redirected to `'/my/shared/folder/myDir/myFiles'`

### ENV detailed examples

#### When both ENVs are set
```sh
export VM_WRAPPER_HOST_PATH="/Volumes/MySharedVolume"
export VM_WRAPPER_GUEST_PATH="/my/shared/folder"

cd "/Volumes/MySharedVolume/path/to/my/CWD"

docker-compose up

# Internally inside the VM before run docker-compose up will do this:
cd "/my/shared/folder/path/to/my/CWD"
# then
docker-compose up
```

#### When only guest path ENV is set
```sh
export VM_WRAPPER_GUEST_PATH="/my/shared/folder"

cd "/Volumes/MySharedVolume/path/to/my/CWD"

docker-compose up

# Internally inside the VM before run docker-compose up will do this:
cd "/my/shared/folder/CWD"
# then
docker-compose up
```

#### When any of the path ENVs are set or only host path is set
```sh
export VM_WRAPPER_HOST_PATH="/Volumes/MySharedVolume"

cd "/Volumes/MySharedVolume/path/to/my/CWD"

docker-compose up

# Internally inside the VM before run docker-compose up will do this:
cd "/Volumes/MySharedVolume/path/to/my/CWD"
# then
docker-compose up
```

### Usage
The same as docker when is installed locally in your system, that's why this is a wrapper ;)

#### Supported commands
- `docker`
- `docker-compose`

### Known issues
- `docker exec -it`
	-	**Error:** "the input device is not a TTY"
	-	**Workaround:** Use `-i` instead, no console output formatting.

- `docker-compose exec`
	-	**Error:** "the input device is not a TTY"
	-	**Workaround:** Use `-T` parameter, no console output formatting.