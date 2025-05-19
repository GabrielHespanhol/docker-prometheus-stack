FROM alpine AS download
 
LABEL MAINTENER="Gabriel Hespanhol"
LABEL VERSION="1.1"

WORKDIR /app

RUN apk update && \
    apk add wget tar && \
    wget https://github.com/prometheus/prometheus/releases/download/v3.3.0/prometheus-3.3.0.linux-amd64.tar.gz && \
    tar -zxvf /app/prometheus-3.3.0.linux-amd64.tar.gz 

FROM alpine

WORKDIR /app

EXPOSE 9090

COPY entrypoint.sh /app/entrypoint.sh

RUN mkdir -p /etc/prometheus && chmod +x /app/entrypoint.sh

COPY  --from=download /app/prometheus-3.3.0.linux-amd64/prometheus.yml /app/prometheus.yml
COPY  --from=download /app/prometheus-3.3.0.linux-amd64/prometheus /etc/prometheus/prometheus

ENTRYPOINT [ "/app/entrypoint.sh" ]
