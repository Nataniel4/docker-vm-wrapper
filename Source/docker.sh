#!/bin/sh

#  docker.sh
#
#
#  Created by Nataniel López on 24/03/2020.
#

source "$(dirname $0)/.vm-wrapper/vm-wrapper"

supportedCommands=(
	'docker',
)

vmWrapperExec "docker" "$@"