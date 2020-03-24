#!/bin/sh

#  docker-compose.sh
#
#
#  Created by Nataniel López on 24/03/2020.
#

source "$(dirname $0)/.vm-wrapper/vm-wrapper"

supportedCommands=(
	'docker-compose',
)

vmWrapperExec "docker-compose" "$@"