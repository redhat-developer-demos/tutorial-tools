FROM fedora

ENV OC_VERSION="4.1.2"
ENV YQ_VERSION="2.4.0"
ENV JQ_VERSION="1.6"
ENV STERN_VERSION="1.10.0"
ENV MAVEN_VERSION="3.6.1"
ENV USER_HOME_DIR="/root"
ARG SHA=b4880fb7a3d81edd190a029440cdf17f308621af68475a4fe976296e71ff4a4b546dd6d8a58aaafba334d309cc11e638c52808a4b0e818fc0fd544226d952544
ARG MAVEN_BASE_URL=https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries

RUN dnf -y update \
    && dnf install -y --nodocs wget git java-1.8.0-openjdk-headless \
    && wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-${OC_VERSION}.tar.gz -O - | tar --exclude='./README.md' -C bin -zxf - \
    && wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -O /usr/local/bin/yq \
    && wget https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_linux_amd64 -O /usr/local/bin/stern \
    && wget https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O /usr/local/bin/jq \
    && chmod +x /usr/local/bin/yq /usr/local/bin/jq /usr/local/bin/stern \
    && mkdir -p /project \
    && mkdir -p /usr/share/maven /usr/share/maven/ref \
    && curl -fsSL -o /tmp/apache-maven.tar.gz ${MAVEN_BASE_URL}/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
    && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \
    && dnf -y clean all

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

COPY config/settings.xml /usr/share/maven/ref
ADD ./bin/*.sh /usr/local/bin/

WORKDIR /project
