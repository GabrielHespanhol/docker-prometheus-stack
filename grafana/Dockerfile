FROM alpine AS download
 
LABEL MAINTENER="Gabriel Hespanhol"
LABEL VERSION="1.0"

WORKDIR /app

RUN apk update && \
    apk add wget tar && \
    wget https://dl.grafana.com/oss/release/grafana-11.6.1.linux-amd64.tar.gz && \
    tar -zxvf /app/grafana-11.6.1.linux-amd64.tar.gz 

FROM alpine

WORKDIR /app/grafana

EXPOSE 3000

COPY  --from=download /app/grafana-v11.6.1/ .

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/app/grafana/bin"

ENTRYPOINT [ "grafana-server" ]
