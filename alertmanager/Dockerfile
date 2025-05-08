FROM alpine AS download
 
LABEL MAINTENER="Gabriel Hespanhol"
LABEL VERSION="1.1"

WORKDIR /app

RUN apk update && \
    apk add wget tar && \
    wget https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-amd64.tar.gz && \
    tar -zxvf alertmanager-0.28.1.linux-amd64.tar.gz 

FROM alpine

WORKDIR /app

EXPOSE 9093

RUN mkdir -p /etc/alertmanager

COPY  --from=download /app/alertmanager-0.28.1.linux-amd64/alertmanager.yml /app/alertmanager.yml
COPY  --from=download /app/alertmanager-0.28.1.linux-amd64/alertmanager /etc/alertmanager/alertmanager

ENTRYPOINT [ "/etc/alertmanager/alertmanager" ]
