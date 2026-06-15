pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup Python') {
            agent {
                docker {
                    image 'python:3.11.15-slim'
                    reuseNode true
                }
            }
            steps {
                sh 'python --version'
            }
        }

        stage('Setup dependencies') {
            agent {
                docker {
                    image 'python:3.11.15-slim'
                    reuseNode true
                }
            }
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Coverage') {
            agent {
                docker {
                    image 'python:3.11.15-slim'
                    reuseNode true
                }
            }
            steps {
                sh 'pytest --cov . --cov-report xml'
            }
        }
    }
}