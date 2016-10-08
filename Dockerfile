FROM alpine:3.3
MAINTAINER Jeremy Wells <jemmyw@gmail.com>

RUN apk update && apk upgrade && apk add zip ca-certificates curl
ENV VERSION 0.7.6

ADD linux_amd64.zip /
RUN unzip /linux_amd64.zip -d /usr/bin \
    && rm /*.zip \
    && mkdir /app

WORKDIR /app
ENTRYPOINT ["/usr/bin/terraform"]
