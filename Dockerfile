FROM amd64/ubuntu:20.04
LABEL maintainer="smalls0098@gmail.com"
ENV WORKDIR /compile
ADD source   $WORKDIR/source
ADD run.sh   $WORKDIR/run.sh
ADD LICENSE   $WORKDIR/LICENSE
ADD README.md   $WORKDIR/README.md
WORKDIR $WORKDIR