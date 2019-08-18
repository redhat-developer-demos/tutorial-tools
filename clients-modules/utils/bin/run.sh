#! /bin/bash

set -e

CONFIGURE_SCRIPTS=(
  ${DEVELOPER_HOME}/.m2/configure-maven.sh
)
source ${DEVELOPER_HOME}/.m2/configure.sh

exec $@