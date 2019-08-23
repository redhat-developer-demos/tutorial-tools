#! /bin/bash

set -eu

useradd -u 1001 -r -g 0 -m -d "${DEVELOPER_HOME}" -s /sbin/nologin -c "A Developer" "${USER_NAME}"
chgrp -R 0 "${DEVELOPER_HOME}"
chmod -R g=u "${DEVELOPER_HOME}"