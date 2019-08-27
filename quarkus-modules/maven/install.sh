#! /bin/bash

set -eu

set -o pipefail

SOURCES_DIR=/tmp/artifacts
SCRIPT_DIR=$(dirname $0)

tar xzf ${SOURCES_DIR}/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/share
mv /usr/share/apache-maven-${MAVEN_VERSION} /usr/share/maven
ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

cp -v ${SCRIPT_DIR}/extras/settings.xml /usr/share/maven/conf/settings.xml

#chrgrp for global maven dir
chgrp -R 0 /usr/share/maven/conf
chmod -R g=u /usr/share/maven/conf
chmod -R g+=rwx  /usr/share/maven/conf