LABEL maintainer="bishoybasily@gmail.com"

FROM ubuntu:20.04
RUN apt-get update && apt-get install unzip nano wget build-essential zlib1g-dev -y

RUN wget --progress=bar:force:noscroll -P /opt https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.0.0.2/graalvm-ce-java11-linux-amd64-21.0.0.2.tar.gz && \
    tar -xzf /opt/graalvm-ce-java11-linux-amd64-21.0.0.2.tar.gz -C /opt && \
    rm /opt/graalvm-ce-java11-linux-amd64-21.0.0.2.tar.gz
ENV PATH="/opt/graalvm-ce-java11-21.0.0.2/bin:${PATH}"
ENV JAVA_HOME="/opt/graalvm-ce-java11-21.0.0.2"

RUN gu install native-image

RUN wget --progress=bar:force:noscroll -P /opt https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
    tar -xzf /opt/apache-maven-3.6.3-bin.tar.gz -C /opt && \
    rm /opt/apache-maven-3.6.3-bin.tar.gz
ENV PATH="/opt/apache-maven-3.6.3/bin:${PATH}"

RUN wget --progress=bar:force:noscroll -P /opt https://downloads.lightbend.com/scala/2.13.5/scala-2.13.5.tgz && \
    tar -xzf /opt/scala-2.13.5.tgz -C /opt && \
    rm /opt/scala-2.13.5.tgz
ENV PATH="/opt/scala-2.13.5/bin:${PATH}"
ENV SCALA_HOME="/opt/scala-2.13.5"

RUN wget --progress=bar:force:noscroll -P /opt https://github.com/sbt/sbt/releases/download/v1.4.8/sbt-1.4.8.zip && \
    unzip /opt/sbt-1.4.8.zip -d /opt && \
    rm /opt/sbt-1.4.8.zip
ENV PATH="/opt/sbt/bin:${PATH}"
