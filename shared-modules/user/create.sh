#! /bin/bash

set -eu

SCRIPT_DIR=$(dirname $0)

cp -v ${SCRIPT_DIR}/entrypoint.sh /entrypoint.sh
chown 0:0 /entrypoint.sh

mkdir -p ${DEVELOPER_HOME} \
  && chgrp -R 0 /home \
  && chmod -R g=u /etc/passwd /home \
  && chmod +x /entrypoint.sh

chgrp -R 0 "${DEVELOPER_HOME}"
chmod -R g=u "${DEVELOPER_HOME}"

