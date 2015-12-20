FROM debian:8.2
RUN apt update && apt install -y git-core build-essential libssl-dev libncurses5-dev unzip subversion gawk && apt-get clean
RUN apt install -y wget python2.7
ADD . /netaidkit
RUN cd /netaidkit && ./nak-pkg/pkg.sh

# build openwrt
RUN cd /netaidkit && git clone git://git.openwrt.org/15.05/openwrt.git && cd openwrt && rm -f .config; make defconfig && ./scripts/feeds update && ./scripts/feeds install -a

# do rest of build
# cannot use '.' as a volume, because MacOS has case-insensite
# filesystem and openwrt doesn't build on that.
# instead, we micht be able to use the copying with tar like below
RUN echo `date +%s` > /netaidkit/files/etc/nak-release
RUN cd /netaidkit/openwrt && sh -c "tar cf - --exclude=openwrt --exclude=.git ./../ | tar xvf -"

RUN cd /netaidkit/openwrt && ./scripts/feeds update && ./scripts/feeds install -a && cat netaidkit.config >> .config && make oldconfig && make V=s && rm -rf build_dir/target*/nak-web-*

VOLUME /dist
