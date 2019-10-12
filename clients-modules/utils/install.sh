#! /bin/bash

set -eu

set -o pipefail

SCRIPT_DIR=$(dirname $0)

SOURCES_DIR=/tmp/artifacts

cp ${SOURCES_DIR}/yq /usr/local/bin/yq
cp ${SOURCES_DIR}/jq /usr/local/bin/jq
cp ${SOURCES_DIR}/stern /usr/local/bin/stern
cp ${SOURCES_DIR}/hey /usr/local/bin/hey

cp -v ${SCRIPT_DIR}/bin/run.sh /usr/local/bin/

chmod +x /usr/local/bin/run.sh

curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx -o  /usr/local/bin/kubectx
curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -o  /usr/local/bin/kubens

chmod +x /usr/local/bin/yq /usr/local/bin/jq /usr/local/bin/stern /usr/local/bin/hey /usr/local/bin/kubectx /usr/local/bin/kubens
