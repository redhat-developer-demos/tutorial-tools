#! /bin/bash

set -eu

set -o pipefail


SOURCES_DIR=/tmp/artifacts

cp -v ${SOURCES_DIR}/kubectl /usr/local/bin
tar --exclude='kubectl' --exclude='README.md' -C /usr/local/bin  -zxf ${SOURCES_DIR}/openshift-client-linux-${OC_VERSION}.tar.gz

chmod +x /usr/local/bin/oc /usr/local/bin/kubectl