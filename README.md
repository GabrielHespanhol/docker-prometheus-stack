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

Imagens no dockerhub:
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

> OBS: Por padrão o docker compose up vai subir a stack utilizando imagens baixadas do dockerhub, pode ser interessante você realizar o build da imagem via dockerfile, sendo um aprendizado válido e importante.
> 
> O build de imagem de forma manual e também via arquivo compose estarei adicionando posteriormente ao repositório.

Subindo containers com o docker-compose:
```bash
docker-compose up -d
```

# Parte 2 - Kubernetes (K8S)

Para o nosso deploy via kubernetes estarei utilizando o minikube com o driver=docker, o minikube permite trabalhar com VMs e diferentes drivers, escolha a sua opção preferida.

Um ponto de observação importante é que foi preciso adicionar um addons ao minikube para uso do nginx-ingress-controller, para isso é muito simples, basta executar o seguinte comando:

```bash
minikube addons enable ingress
```

### Falando de kubernetes (K8S)

Diferente do docker compose, onde temos um único arquivo com todas definições de sua execução, o kubernetes até permite fazer em um único arquivo porém achei melhor separar as coisas e deixar elas de forma mais organizada. 

Para nossa stack, vamos utilizar alguns objetos (Talvez objeto não seja a melhor definição porém me ajudou na compreensão).

- Pod: A menor unidade implantável no Kubernetes. Um Pod seria o equivalente a um container no Docker, porém existem importantes diferenças entre um pod e um container e vou tentar explicar. Um Pod pode ter um ou mais containers em execução, digamos que você define os recursos para o Pod como rede e CPU e esses recursos serão compartilhados entre os containers do pod.
- Deployment: O deployment é um objeto que vai gerenciar a implantação de um pod, em comparação com o docker comopose digamos que o deployment vai definir o número de replicas, volumes, restarts e outras politicas para cuidar da execução do pod.
- Service: O service é quem vai expor e permitir que possamos acessar os serviços em execução em nossos pods. Ele fornece um endereço IP estável e DNS para um conjunto de Pods. Comparando com o Docker Compose, onde podemos expor uma porta do host, o Service no Kubernetes oferece funcionalidades semelhantes e mais avançadas, como diferentes tipos de exposição (ClusterIP, NodePort, LoadBalancer).

> OBS: Essa é uma explicação simples e talvez não a mais detalhada e completa, a ideia é deixar claro a função de cada objeto que estamos utilizando e somar na explicação dos comentários internos em cada arquivo.
> Essa documentação tende a melhorar e ficar mais completa com a ajuda dos leitores e meu progresso com os estudos com kubernetes.


### Mão na massa e bora ver esse k8s em ação

Para executar os recursos no k8s você precisa acessar a basta kubernetes do projeto:

```bash
cd kubernetes
```

Agora vamos rodar dois comandos, um para criar e outro para aplicar nossos arquivos:

```bash
kubectl create -f .
kubectl apply -f .
```

Com isso você deve receber uma mensagem informando que os recursos foram criados e agora pode testar seu kubernetes e práticar. 

Se tudo ocorreu bem você terá um ingress para conectar ao grafana via endereço `grafana.127.0.0.1.nip.io`, caso esteja com o minikube rodando no macOs ou windows configurações adicionais podem ser necessárias para o ingress funcionar. 


# Tarefas que tenho mapeadas
[] Melhorar a documentação e descrições
[] Como enviar imagens locais de meu docker para o minikube
[] Ingress funcionando Linux/Windows/macOS
[] Criar recursos de storage
[] Implementar o argoCD ou ferramenta de CI/CD