FROM amd64/ubuntu:latest

LABEL maintainer="smalls0098@gmail.com"

ENV WORKDIR /compile

ADD ./clone.sh $WORKDIR/clone.sh
RUN chmod +x $WORKDIR/clone.sh

ADD ./modify.sh $WORKDIR/modify.sh
RUN chmod +x $WORKDIR/modify.sh

ADD ./modify.sh $WORKDIR/run.sh
RUN chmod +x $WORKDIR/run.sh

ADD ./.config $WORKDIR/.config