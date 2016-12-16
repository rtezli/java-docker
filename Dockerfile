FROM debian:jessie

MAINTAINER Robert Tezli (robert@pixills.com)

ENV JAVA_MAJOR_VERSION 1
ENV JAVA_MINOR_VERSION 8
ENV JAVA_UPDATE_VERSION 111
ENV JAVA_VERSION ${JAVA_MINOR_VERSION}u${JAVA_UPDATE_VERSION}
ENV JAVA_BUILD_VERSION b14
ENV JAVA_ROOT /usr/lib/java
ENV JAVA_HOME ${JAVA_ROOT}/jdk${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}.0_${JAVA_UPDATE_VERSION}
ENV PATH ${PATH}:${JAVA_HOME}/bin
ENV PATH ${PATH}:${JAVA_HOME}/sbin

RUN apt-get update &&\
    apt-get install -yqq wget &&\
    mkdir -p ${JAVA_HOME} &&\
    wget -nv -qO- --no-check-certificate --no-cookies --header "Cookie:oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-${JAVA_BUILD_VERSION}/server-jre-${JAVA_VERSION}-linux-x64.tar.gz | tar zx -C ${JAVA_ROOT}

RUN update-alternatives --install "/usr/bin/java"   "java"   "${JAVA_HOME}/bin/java" 1 &&\
    update-alternatives --set                       "java"   "${JAVA_HOME}/bin/java"
