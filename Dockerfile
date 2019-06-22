FROM fedora:29

ENV OC_VERSION="4.1.2"
ENV YQ_VERSION="2.4.0"
ENV JQ_VERSION="1.6"

RUN dnf -y update \
    && dnf -y install wget git \
    wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-${OC_VERSION}.tar.gz -O - | tar --exclude='./README.md' -C bin -zxf - \
    && wget https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64 -O /usr/local/bin/stern \
    && wget https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O /usr/local/bin/jq \
    && dnf -y clean all \
    && mkdir -p /project

WORKDIR /project
