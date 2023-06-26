#!/bin/bash

DOCKER_COMMAND=/usr/bin/docker
PROJECT_ROOT=/workspaces/devcontainer-lemp-for-codespaces

function apt_command() {
    local PACKAGES="btop neofetch"
    sudo apt update && sudo apt install $PACKAGES -y
}

function build_docker_compose() {
    if [ -x $DOCKER_COMMAND ]; then
        cd $PROJECT_ROOT
        cp sample.env .env
        $DOCKER_COMMAND compose build
    fi
}

function main() {
    apt_command
    build_docker_compose
}

main