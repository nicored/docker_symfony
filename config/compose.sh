#!/bin/bash

COMPOSE_FILE="./compose_files/"
COMMON_FILE="common.yml"
YAML_EXT=".yml"

if [ $# -eq 0 -o $1 == "dev" ]; then
	echo "Building for dev environment"
	ENV="dev"
else
	echo "Environment is $1 environment";
	ENV=$1
fi

filepath=$COMPOSE_FILE$ENV$YAML_EXT
if [ ! -f $filepath ]; then
	echo "Docker Compose file $filepath NOT FOUND."
	exit 1
fi

commonFilePath=$COMPOSE_FILE$COMMON_FILE
if [ ! -f $commonFilePath ]; then
	echo "Docker Compose file $commonFilePath NOT FOUND."
	exit 1
fi

docker-compose -f $commonFilePath -f $filepath up -d