FROM alpine:latest as BUILD

MAINTAINER Gabriel Lopes Hespanhol

RUN apk update && apk upgrade && \
    apk add wget && cd /tmp && \
    wget  https://github.com/prometheus/prometheus/releases/download/v2.45.1/prometheus-2.45.1.linux-amd64.tar.gz && \
    tar -zxvf prometheus-2.45.1.linux-amd64.tar.gz

FROM alpine:latest

RUN mkdir /etc/prometheus && mkdir /var/lib/prometheus

COPY --from=BUILD /tmp/prometheus-2.45.1.linux-amd64/console* /etc/prometheus
COPY --from=BUILD /tmp/prometheus-2.45.1.linux-amd64/prometheus /usr/local/bin/prometheus
COPY ./prometheus.yml /etc/prometheus/prometheus.yml

ENTRYPOINT prometheus --config.file=/etc/prometheus/prometheus.yml \
                      --storage.tsdb.retention.time=15d \
                      --storage.tsdb.path=/var/lib/prometheus 

EXPOSE 9090:9090