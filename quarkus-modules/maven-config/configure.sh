#!/bin/sh
set -e

set -o pipefail

SOURCES_DIR=/tmp/artifacts
SCRIPT_DIR=$(dirname $0)

mkdir -p ${DEVELOPER_HOME}/.m2/repository
cp -v ${SCRIPT_DIR}/extras/* ${DEVELOPER_HOME}/.m2

chown -R 1001:0 ${DEVELOPER_HOME}