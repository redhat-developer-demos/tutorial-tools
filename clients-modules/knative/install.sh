#! /bin/bash

set -eu

set -o pipefail


SOURCES_DIR=/tmp/artifacts

cp -v "${SOURCES_DIR}/kn"  /usr/local/bin/kn
tar -C /usr/local/bin --exclude='kamel.asc' \
  --exclude='kamel.sha512'  \
  --exclude='NOTICE' \
  --exclude='LICENSE' \
  -zxf "${SOURCES_DIR}/kamel.tar.gz"
tar -C /usr/local/bin \
  --exclude='LICENSE' \
  --exclude='README.md' \
  --no-same-owner \
  -zxf "${SOURCES_DIR}/tkn.tar.gz"
chmod +x  /usr/local/bin/kn /usr/local/bin/tkn /usr/local/bin/kamel
