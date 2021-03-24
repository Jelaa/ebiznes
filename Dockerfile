FROM ubuntu:18.04

ENV TZ=Europe/Warsaw

ENV SCALA_VERSION 2.12.13
ENV SBT_VERSION 1.4.9

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y vim git wget unzip npm

#JAVA
RUN apt-get install -y openjdk-8-jdk

#SCALA
RUN wget http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb
RUN dpkg -i scala-$SCALA_VERSION.deb

#SBT
RUN wget http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb
RUN dpkg -i sbt-$SBT_VERSION.deb

RUN useradd -ms /bin/bash ajelonek
RUN adduser ajelonek sudo

USER ajelonek
WORKDIR /home/ajelonek

RUN mkdir /home/ajelonek/data

VOLUME /home/ajelonek/data

EXPOSE 3000
EXPOSE 9000
