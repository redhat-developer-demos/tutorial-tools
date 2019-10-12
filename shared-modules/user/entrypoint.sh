#!/bin/bash

# Ensure $HOME exists when starting
if [ ! -d "${HOME}" ]; then
  mkdir -p "${HOME}"
fi

# Setup $PS1 for a consistent and reasonable prompt
if [ -w "${HOME}" ] && [ ! -f "${HOME}"/.bashrc ]; then
  echo "PS1='\s-\v \w \$ '" > "${HOME}"/.bashrc
fi

# Add current (arbitrary) user to /etc/passwd
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-developer}:x:$(id -u):0:${USER_NAME:-developer} user:${HOME}:/bin/bash" >> /etc/passwd
  fi
fi

CONFIGURE_SCRIPTS=(
  ${DEVELOPER_HOME}/.m2/configure-maven.sh
)
source ${DEVELOPER_HOME}/.m2/configure.sh

alias docker=podman

exec "$@"