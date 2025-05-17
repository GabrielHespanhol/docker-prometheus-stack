pipeline {
    agent any

    environment {
        IMAGE_NAME = 'lopes97/prometheus-3.3.0'
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
        stage('Push Docker image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhubuser', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
                        sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }
}
