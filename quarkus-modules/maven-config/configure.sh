#!/bin/sh
set -e

set -o pipefail

SOURCES_DIR=/tmp/artifacts
SCRIPT_DIR=$(dirname $0)

mkdir -p ${DEVELOPER_HOME}/.m2/repository
cp -v ${SCRIPT_DIR}/extras/*.sh ${DEVELOPER_HOME}/.m2

chmod -R g+=rwx ${DEVELOPER_HOME}/.m2