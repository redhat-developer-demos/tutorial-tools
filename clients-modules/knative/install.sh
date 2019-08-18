#! /bin/bash

set -eu

set -o pipefail


SOURCES_DIR=/tmp/artifacts

cp -v "${SOURCES_DIR}/kn"  /usr/local/bin/kn
tar  -C /usr/local/bin  -zxf "${SOURCES_DIR}/tkn_0.2.2_Linux_x86_64.tar.gz"
chmod +x  /usr/local/bin/kn /usr/local/bin/tkn
