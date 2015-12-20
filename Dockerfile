FROM debian:8.2
RUN apt update && apt install -y git-core build-essential libssl-dev libncurses5-dev unzip subversion gawk && apt-get clean
RUN apt install -y wget python2.7
ADD . /netaidkit
RUN cd /netaidkit && ./nak-pkg/pkg.sh

# build openwrt
RUN cd /netaidkit && git clone git://git.openwrt.org/15.05/openwrt.git && cd openwrt && rm -f .config; make defconfig && ./scripts/feeds update && ./scripts/feeds install -a

