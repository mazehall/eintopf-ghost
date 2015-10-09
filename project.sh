#!/usr/bin/env bash

#####
# change this part for your own configuration
#####

PROJECT_DIR="ghost"
CONFIG_DIR="${PWD##*/}"

####
. ./project.env.sh
####


####
# implement you own cli wrapper
####

xcompose () {
    cd "$CONFIG_PATH" && docker-compose "$@"
}

if [ "$INBOX" != true ]; then
  if callInbox "which docker-compose >> /dev/null"; then
      xcompose () {
          callInbox "docker-compose $@"
      }
  fi
fi