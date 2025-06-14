FROM alpine AS download
 
LABEL MAINTENER="Gabriel Hespanhol"
LABEL VERSION="1.2"

# Alterar caso queira trocar de arquitetura
ENV SYSTEM_ARCH="arm64"

WORKDIR /app

RUN apk update && \
    apk add wget tar && \
    wget https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-${SYSTEM_ARCH}.tar.gz && \
    tar -zxvf alertmanager-0.28.1.linux-${SYSTEM_ARCH}.tar.gz 

FROM alpine

LABEL MAINTENER="Gabriel Hespanhol"
LABEL VERSION="1.2"

# Alterar caso queira trocar de arquitetura
ENV SYSTEM_ARCH="arm64"

WORKDIR /app

EXPOSE 9093

RUN mkdir -p /etc/alertmanager

COPY  --from=download /app/alertmanager-0.28.1.linux-${SYSTEM_ARCH}/alertmanager.yml /app/alertmanager.yml
COPY  --from=download /app/alertmanager-0.28.1.linux-${SYSTEM_ARCH}/alertmanager /etc/alertmanager/alertmanager

ENTRYPOINT [ "/etc/alertmanager/alertmanager" ]
