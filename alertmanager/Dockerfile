FROM alpine:latest as BUILD

MAINTAINER Gabriel Lopes Hespanhol

RUN apk update && apk upgrade && \
    apk add wget && cd /tmp && \
    wget  https://github.com/prometheus/alertmanager/releases/download/v0.26.0/alertmanager-0.26.0.linux-amd64.tar.gz && \
    tar -zxvf alertmanager-0.26.0.linux-amd64.tar.gz

FROM alpine:latest

RUN mkdir /etc/alertmanager && mkdir /var/lib/alertmanager

COPY --from=BUILD /tmp/alertmanager-0.26.0.linux-amd64/alertmanager /usr/local/bin/alertmanager
COPY ./alertmanager.yml /etc/alertmanager/alertmanager.yml

ENTRYPOINT alertmanager --config.file=/etc/alertmanager/alertmanager.yml \
                        --storage.tsdb.path=/var/lib/alertmanager 

EXPOSE 9093:9093