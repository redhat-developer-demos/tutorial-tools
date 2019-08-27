#! /bin/bash

set -e

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

CONFIGURE_SCRIPTS=(
  ${DEVELOPER_HOME}/.m2/configure-maven.sh
)
source ${DEVELOPER_HOME}/.m2/configure.sh

exec $@