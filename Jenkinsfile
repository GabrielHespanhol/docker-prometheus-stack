pipeline {
    agent any

    environment {
        IMAGE_NAME = 'lopes97/prometheus-stack'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-token', url: 'https://github.com/GabrielHespanhol/docker-prometheus-stack.git'
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
}
