#! /bin/bash

set -eu

set -o pipefail

SOURCES_DIR=/tmp/artifacts

mkdir -p /opt/graalvm 
tar -xzf ${SOURCES_DIR}/graalvm-ce-amd64.tar.gz -C /opt/graalvm --strip-components=1
/opt/graalvm/bin/gu --auto-yes install native-image
