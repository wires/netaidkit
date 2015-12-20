FROM debian:8.2
RUN apt update && apt install -y git-core build-essential libssl-dev libncurses5-dev unzip subversion gawk && apt-get clean
RUN apt install -y wget python2.7
RUN mkdir /netaidkit
VOLUME /netaidkit
