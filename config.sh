#!/bin/bash

# Command used to launch docker
DOCKER_CMD='sudo docker'

# Where to store the backups
BACKUP_PATH='/media/store/docker-backup'

# The name of the docker image
PROJECT_NAME="keepass"

# BUILD ARGS
BUILD_ARGS=(
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    --memory="256m"
    --cpu-shares=1024

    -v $(pwd)/data/db:/home/$(whoami)/data/db
    -v $(pwd)/data/key:/home/$(whoami)/data/key
    -v $(pwd)/data/config/keepassxc:/home/$(whoami)/.config/keepassxc
    -v $(pwd)/data/config/QtProject.conf:/home/$(whoami)/.config/QtProject.conf

    --rm
    -d
    )
