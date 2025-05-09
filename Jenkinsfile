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
                slackSend(
                    webhookUrl: env.SLACK_URL,
                    message: "✅ *Build concluído com sucesso!* Imagem: `${IMAGE_NAME}:${IMAGE_TAG}`"
                )
            }
        }
        failure {
            withCredentials([string(credentialsId: 'slack-webhook', variable: 'SLACK_URL')]) {
                slackSend(
                    webhookUrl: env.SLACK_URL,
                    message: "❌ *Build falhou!* Confira os logs para mais detalhes."
                )
            }
        }
        unstable {
            withCredentials([string(credentialsId: 'slack-webhook', variable: 'SLACK_URL')]) {
                slackSend(
                    webhookUrl: env.SLACK_URL,
                    message: "⚠️ *Build instável.* Verifique possíveis alertas."
                )
            }
        }
        always {
            // opcional: limpar workspace, enviar métricas, etc.
        }
    }
}
