pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('SC_AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('SC_AWS_SECRET_ACCESS_KEY')
        AWS_REGION = 'us-east-1'
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

        stage('Install AWS CLI') {
            steps {
                script {
                    // Cài đặt AWS CLI nếu chưa có
                    sh '''
                    if ! command -v aws &> /dev/null
                    then
                        echo "AWS CLI not found. Installing..."
                        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                        unzip awscliv2.zip
                        sudo ./aws/install
                    fi
                    '''
                }
            }
        }

        stage('Configure AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                    credentialsId: 'SC_AWS_ACCESS_KEY_ID'
                ]]) {
                    script {
                        sh 'aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID'
                        sh 'aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY'
                        sh 'aws s3 ls'
                    }
                }
            }
        }

        stage('Setup Terraform') {
            steps {
                script {
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

    post {
        failure {
            echo 'Deployment failed. Please check the logs for details.'
        }
    }
}
