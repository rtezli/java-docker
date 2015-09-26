FROM debian:wheezy

MAINTAINER Robert Tezli <robert@pixills.com>

RUN apt-get update && \
    apt-get install -y wget && \
    mkdir -p /usr/share/java && \
    cd /usr/share/java && \

    wget -nv --no-check-certificate \
    --no-cookies \
    --header "Cookie:oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jre-8u60-linux-x64.tar.gz && \
    tar zxf jre-8u60-linux-x64.tar.gz && \
    rm -rf jre-8u60-linux-x64.tar.gz && \
    ln -s /usr/share/java/jre1.8.0_60 /usr/share/java/latest && \
    update-alternatives --install "/usr/bin/java"   "java"   "/usr/share/java/latest/bin/java" 1 && \
    update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/share/java/latest/bin/javaws" 1 && \
    update-alternatives --set                       "java"   "/usr/share/java/latest/bin/java" && \
    update-alternatives --set                       "javaws" "/usr/share/java/latest/bin/javaws"

ENV JAVA_HOME /usr/share/java/latest
ENV PATH /usr/share/java/latest/bin:\
/usr/share/java/latest/sbin:\
$PATH
