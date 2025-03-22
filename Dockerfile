FROM ubuntu:20.04

RUN apt-get update && apt-get install unzip nano wget build-essential zlib1g-dev -y

ARG INSTALLATION_DIRECTORY=/opt

ARG GRADLE_VERSION=8.6
RUN wget -P ${INSTALLATION_DIRECTORY} https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip ${INSTALLATION_DIRECTORY}/gradle-${GRADLE_VERSION}-bin.zip -d ${INSTALLATION_DIRECTORY} && \
    rm ${INSTALLATION_DIRECTORY}/gradle-${GRADLE_VERSION}-bin.zip
ENV PATH="${INSTALLATION_DIRECTORY}/gradle-${GRADLE_VERSION}/bin:${PATH}"

ARG MAVEN_VERSION=3.9.6
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
    tar -xzf ${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}.tgz --one-top-level=scala-${SCALA_VERSION} --strip-components 1 && rm ${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}.tgz && \
    mv scala-${SCALA_VERSION} ${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}
ENV PATH="${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}/bin:${PATH}"
ENV SCALA_HOME="${INSTALLATION_DIRECTORY}/scala-${SCALA_VERSION}"



ARG NODE_VERSION=22.14.0
RUN wget -P ${INSTALLATION_DIRECTORY} https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz && \
    tar -xzf ${INSTALLATION_DIRECTORY}/node-v${NODE_VERSION}-linux-x64.tar.xz -C ${INSTALLATION_DIRECTORY} && \
    rm ${INSTALLATION_DIRECTORY}/node-v${NODE_VERSION}-linux-x64.tar.xz
ENV PATH="${INSTALLATION_DIRECTORY}/node-v${NODE_VERSION}-linux-x64/bin:${PATH}"

ARG JAVA_VERSION=21.0.2
RUN wget -P ${INSTALLATION_DIRECTORY} https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${JAVA_VERSION}/graalvm-community-jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz && \
    tar -xf ${INSTALLATION_DIRECTORY}/graalvm-community-jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz --one-top-level=java-${JAVA_VERSION} --strip-components 1 && rm ${INSTALLATION_DIRECTORY}/graalvm-community-jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz && \
    mv java-${JAVA_VERSION} ${INSTALLATION_DIRECTORY}/java-${JAVA_VERSION}
ENV PATH="${INSTALLATION_DIRECTORY}/java-${JAVA_VERSION}/bin:${PATH}"
ENV JAVA_HOME="${INSTALLATION_DIRECTORY}/java-${JAVA_VERSION}"

LABEL maintainer="bishoybasily@gmail.com"
