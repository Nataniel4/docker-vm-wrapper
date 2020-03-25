# Docker VM Wrapper
Use docker from a VM (using SSH) in your host machine as if were locally installed.

## Installation

### Requirements
Install [vm-wrapper](https://github.com/Nataniel4/vm-wrapper)

Then copy the files from `Release` folder into the `/usr/local/bin` directory of you host system and set the ENV vars into your bash profile (if needed).
```sh
cp -r Release/. /usr/local/bin
```

## ENV Vars
- `VM_WRAPPER_SSH` **(required)**: The ssh connection in **user@domain** format. Example: `johndoe@localhost`
- `VM_WRAPPER_GUEST_PATH` **(optional)**: The guest path that you want to use inside the VM. By default uses the real CWD of your execution.
- `VM_WRAPPER_HOST_PATH` **(optional)**: The host path that you want to replace by the guest path inside the VM.

**IMPORTANT:** For more information about the paths ENVs purposes and how it works, please read the [vm-wrapper](https://github.com/Nataniel4/vm-wrapper) documentation.

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