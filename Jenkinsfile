pipeline {
    agent any

    environment {
        IMAGE_NAME = 'lopes97/prometheus-stack'
        IMAGE_TAG  = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-token',
                    url: 'https://github.com/GabrielHespanhol/docker-prometheus-stack.git'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} prometheus/"
                }
            }
        }
    }

    post {
        success {
            withCredentials([string(credentialsId: 'slack-webhook', variable: 'SLACK_URL')]) {
                script {
                    def payload = [
                        text: "✅ *Build concluído com sucesso!* Imagem: `${IMAGE_NAME}:${IMAGE_TAG}`"
                    ]
                    httpRequest httpMode: 'POST',
                                url: SLACK_URL,
                                contentType: 'APPLICATION_JSON',
                                requestBody: groovy.json.JsonOutput.toJson(payload)
                }
            }
        }
        failure {
            withCredentials([string(credentialsId: 'slack-webhook', variable: 'SLACK_URL')]) {
                script {
                    def payload = [
                        text: "❌ *Build falhou!* Verifique os logs no Jenkins."
                    ]
                    httpRequest httpMode: 'POST',
                                url: SLACK_URL,
                                contentType: 'APPLICATION_JSON',
                                requestBody: groovy.json.JsonOutput.toJson(payload)
                }
            }
        }
    }
}
