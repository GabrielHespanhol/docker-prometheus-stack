# docker-prometheus-stack

## Uma simples stack de observabilidade utilizando docker

Aqui estamos utilizando algumas tecnologias open source para observabilidade como
- Prometheus
- Alertmanager
- Grafana

Temos os arquivos de Dockerfile para gerar o build das imagens

Você também pode baixar as imagens no docker hub
- lopes97/grafana-11.6.1:1.0
- lopes97/alertmanager-0.28.1:1.0
- lopes97/prometheus-3.3.0:1.0

Ainda será feito melhorias no projeto, para deixar o stack mais personalizável.

Meu docker hub: https://hub.docker.com/repositories/lopes97

## Como subir o projeto de forma simples:

> É importante ter o docker e docker-compose instalados em sua máquina.
> Também é importante verificar a necessidade do comando sudo

```bash
git clone https://github.com/GabrielHespanhol/docker-prometheus-stack.git && cd docker-prometheus-stack
```

```bash
docker-compose up -d --build
```

## Realizando testes com o jenkins
