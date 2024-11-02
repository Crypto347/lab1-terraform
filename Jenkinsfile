pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('SC_AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('SC_AWS_SECRET_ACCESS_KEY')
        AWS_REGION = 'us-west-2' // Hoặc bạn có thể lấy từ biến môi trường của Jenkins
        WORKING_DIRECTORY = "./Terraform/environments/staging"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                script {
                    sh 'ls -la'
                }
            }
        }

        stage('Setup Terraform') {
            steps {
                script {
                    // Cài đặt Terraform nếu cần thiết
                    sh 'curl -sL https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_amd64.zip -o terraform.zip'
                    sh 'unzip terraform.zip && chmod +x terraform && mv terraform /usr/local/bin/'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${env.WORKING_DIRECTORY}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${env.WORKING_DIRECTORY}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${env.WORKING_DIRECTORY}") {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${env.WORKING_DIRECTORY}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
