FROM ubuntu:20.04

RUN apt-get update && apt-get install unzip nano wget build-essential zlib1g-dev -y

ARG INSTALLATION_DIRECTORY=/opt

ARG GRADLE_VERSION=6.8.3
RUN wget -P ${INSTALLATION_DIRECTORY} https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip ${INSTALLATION_DIRECTORY}/gradle-${GRADLE_VERSION}-bin.zip -d ${INSTALLATION_DIRECTORY} && \
    rm ${INSTALLATION_DIRECTORY}/gradle-${GRADLE_VERSION}-bin.zip
ENV PATH="${INSTALLATION_DIRECTORY}/gradle-${GRADLE_VERSION}/bin:${PATH}"

ARG MAVEN_VERSION=3.8.1
RUN wget -P ${INSTALLATION_DIRECTORY} https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xzf ${INSTALLATION_DIRECTORY}/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C ${INSTALLATION_DIRECTORY} && \
    rm ${INSTALLATION_DIRECTORY}/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV PATH="${INSTALLATION_DIRECTORY}/apache-maven-${MAVEN_VERSION}/bin:${PATH}"

ARG SBT_VERSION=1.4.8
RUN wget -P ${INSTALLATION_DIRECTORY} https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.zip && \
    unzip ${INSTALLATION_DIRECTORY}/sbt-${SBT_VERSION}.zip -d ${INSTALLATION_DIRECTORY} && \
    rm ${INSTALLATION_DIRECTORY}/sbt-${SBT_VERSION}.zip
ENV PATH="${INSTALLATION_DIRECTORY}/sbt/bin:${PATH}"

ARG SCALA_VERSION=2.12.10
RUN wget -P ${INSTALLATION_DIRECTORY} https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz && \
    tar -xzf ${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}.tgz -C ${INSTALLATION_DIRECTORY} && \
    rm ${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}.tgz
ENV PATH="${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}/bin:${PATH}"
ENV SCALA_HOME="${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}"

ARG GRAALVM_VERSION=21.0.0.2
RUN wget -P ${INSTALLATION_DIRECTORY} https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz && \
    tar -xzf ${INSTALLATION_DIRECTORY}/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz -C ${INSTALLATION_DIRECTORY} && \
    rm ${INSTALLATION_DIRECTORY}/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz
ENV PATH="${INSTALLATION_DIRECTORY}/graalvm-ce-java11-${GRAALVM_VERSION}/bin:${PATH}"
ENV JAVA_HOME="${INSTALLATION_DIRECTORY}/graalvm-ce-java11-${GRAALVM_VERSION}"

RUN gu install native-image

LABEL maintainer="bishoybasily@gmail.com"



