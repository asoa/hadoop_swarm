FROM alpine

MAINTAINER Newnius <docker@newnius.com>

RUN apk add --no-cache  openssh

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
&& chmod 600 /root/.ssh/authorized_keys 

ADD entrypoint.sh /etc/entrypoint.sh

#ENTRYPOINT ["/etc/entrypoint.sh"]

