#! /bin/bash

set -eu

set -o pipefail


SOURCES_DIR=/tmp/artifacts

tar --exclude='README.md' -C /usr/local/bin  -zxf ${SOURCES_DIR}/openshift-client-linux.tar.gz

chmod +x /usr/local/bin/oc /usr/local/bin/kubectl