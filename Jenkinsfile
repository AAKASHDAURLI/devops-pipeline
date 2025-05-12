pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                 git branch: 'main', url: 'https://github.com/AAKASHDAURLI/devops-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-html-app")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker rm -f html-container || true'
                    sh 'docker run -d -p 8080:80 --name html-container my-html-app'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
