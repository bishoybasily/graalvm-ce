FROM ubuntu:20.04

RUN apt-get update && apt-get install unzip nano wget build-essential zlib1g-dev -y

ARG GRADLE_VERSION=6.8.3
RUN wget -P /opt https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip /opt/gradle-${GRADLE_VERSION}-bin.zip -d /opt && \
    rm /opt/gradle-${GRADLE_VERSION}-bin.zip
ENV PATH="/opt/gradle-${GRADLE_VERSION}/bin:${PATH}"

ARG MAVEN_VERSION=3.8.1
RUN wget -P /opt https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xzf /opt/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt && \
    rm /opt/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV PATH="/opt/apache-maven-${MAVEN_VERSION}/bin:${PATH}"

ARG SBT_VERSION=1.4.8
RUN wget -P /opt https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.zip && \
    unzip /opt/sbt-${SBT_VERSION}.zip -d /opt && \
    rm /opt/sbt-${SBT_VERSION}.zip
ENV PATH="/opt/sbt/bin:${PATH}"

ARG SCALA_VERSION=2.12.10
RUN wget -P /opt https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz && \
    tar -xzf /opt/scala-${SCALA_VERSION}.tgz -C /opt && \
    rm /opt/scala-${SCALA_VERSION}.tgz
ENV PATH="/opt/scala-${SCALA_VERSION}/bin:${PATH}"
ENV SCALA_HOME="/opt/scala-${SCALA_VERSION}"

ARG GRAALVM_VERSION=21.0.0.2
RUN wget -P /opt https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz && \
    tar -xzf /opt/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz -C /opt && \
    rm /opt/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz
ENV PATH="/opt/graalvm-ce-java11-${GRAALVM_VERSION}/bin:${PATH}"
ENV JAVA_HOME="/opt/graalvm-ce-java11-${GRAALVM_VERSION}"

RUN gu install native-image

LABEL maintainer="bishoybasily@gmail.com"



