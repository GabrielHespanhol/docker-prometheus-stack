FROM alpine AS download
 
LABEL MAINTENER="Gabriel Hespanhol"
LABEL VERSION="1.1"

# Alterar para arm64 caso queira trocar de arquitetura
ENV SYSTEM_ARCH="arm64"

WORKDIR /app

RUN apk update && \
    apk add wget tar && \
    wget https://github.com/prometheus/prometheus/releases/download/v3.3.0/prometheus-3.3.0.linux-${SYSTEM_ARCH}.tar.gz && \
    tar -zxvf /app/prometheus-3.3.0.linux-${SYSTEM_ARCH}.tar.gz 

FROM alpine

LABEL MAINTENER="Gabriel Hespanhol"
LABEL VERSION="1.1"

# Alterar para arm64 caso queira trocar de arquitetura
ENV SYSTEM_ARCH="arm64"

WORKDIR /etc/prometheus

EXPOSE 9090

COPY entrypoint.sh /etc/prometheus/entrypoint.sh

RUN mkdir -p /etc/prometheus && chmod +x /etc/prometheus/entrypoint.sh

COPY  --from=download /app/prometheus-3.3.0.linux-${SYSTEM_ARCH}/prometheus.yml /etc/prometheus/prometheus.yml
COPY  --from=download /app/prometheus-3.3.0.linux-${SYSTEM_ARCH}/prometheus /etc/prometheus/prometheus

ENTRYPOINT [ "/etc/prometheus/entrypoint.sh" ]
