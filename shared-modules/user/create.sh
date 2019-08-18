#! /bin/bash

set -eu

set -o pipefail

groupadd -r "${GROUP_NAME}" -g 1001 && useradd -u 1001 -r -g "${GROUP_NAME}" -m -d ${DEVELOPER_HOME} -s /sbin/nologin -c "A Developer" "${USER_NAME}"