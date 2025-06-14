## Uma simples stack de observabilidade para estudos de docker e kubernetes

Uma breve explicação: Estarei utilizando a mesma stack com docker e kubernetes (minikube) para comparação e estudo.

### Parte 1 - Subindo a stack com docker e docker-compose

Aqui estamos utilizando algumas tecnologias open source para observabilidade

- Grafana
- Prometheus
- Alertmanager

Temos dois principais diretórios no repositório

**Docker**: Nesse diretório temos alguns arquivos, em principal:
- Dockerfile utilizado para gerar a imagem do prometheus
- Dockerfile utilizado para gerar a imagem do alertmanager
- docker-compose.yml utilizado para subir o projeto, onde é utilizado a imagem docker direto de meu dockerhub e imagem oficial do grafana.

Temos os arquivos de Dockerfile para gerar o build das imagens

Imagens do dockerhub:
- grafana/grafana:latest
- lopes97/alertmanager:2.0
- lopes97/prometheus:2.0

Meu docker hub: https://hub.docker.com/repositories/lopes97

## Como subir o projeto de forma simples:

> É importante ter o docker e docker-compose instalados em sua máquina.
> Também é importante verificar a necessidade do comando sudo

Acessando o diretório Docker para utilização do docker-compose:
```bash
git clone https://github.com/GabrielHespanhol/docker-prometheus-stack.git && cd docker-prometheus-stack/Docker
```

Subindo containers com o docker-compose:
```bash
docker-compose up -d --build
```

# Parte 2 - Kubernetes (Ainda pendente)