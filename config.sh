#!/bin/bash

# Command used to launch docker
DOCKER_CMD="`which docker`"

# Where to store the backups
BACKUP_PATH=""

# The name of the docker image
PROJECT_NAME="keepass"

# Keepass DB & KEY dir paths
KEEPASS_DB_PATH="`pwd`/data/db"
KEEPASS_KEY_PATH="`pwd`/data/key"

# BUILD ARGS
BUILD_ARGS=(
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    --memory="256m"
    --cpu-shares=1024

    -v $KEEPASS_DB_PATH:/home/$(whoami)/data/db
    -v $KEEPASS_KEY_PATH:/home/$(whoami)/data/key
    -v $(pwd)/data/config/keepassxc:/home/$(whoami)/.config/keepassxc
    -v $(pwd)/data/config/QtProject.conf:/home/$(whoami)/.config/QtProject.conf

    --rm
    -d
    )
