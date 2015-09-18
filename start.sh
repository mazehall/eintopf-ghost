#!/usr/bin/env bash

: ${EINTOPF_HOME:=$HOME}

if [ -d "/vagrant" ]
then
  INBOX=true
  PROJECTS_PATH="/projects"
  CONFIGS_PATH="/vagrant"
else
  INBOX=false
  PROJECTS_PATH="$EINTOPF_HOME/eintopf"
  CONFIGS_PATH="$EINTOPF_HOME/.eintopf/default"
fi

if [ "$INBOX" = true ] ; then
  cd "$CONFIGS_PATH/configs/eintopf-ghost" docker-compose up
else
  cd "$CONFIGS_PATH"
  if ! vagrant ssh -c 'cd /vagrant/configs/eintopf-ghost && docker-compose up' ; then
      echo "starting docker containers failed";
      exit 1
  fi
fi

echo "done"
