pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // Thay đổi nếu cần
        WORKING_DIRECTORY = "./Terraform/environments/staging"
    }

    stages {
        stage('Configure AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                    credentialsId: 'dev-user-aws-credentials'
                ]]) {
                    script {
                        // Cấu hình AWS CLI để sử dụng các biến môi trường AWS
                        sh '''
                            aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                            aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                            aws configure set region $AWS_REGION
                        '''
                    }
                }
            }
        }

        stage('Checkout Code') {
            steps {
                checkout scm
                script {
                    sh 'ls -la'
                }
            }
        }

        stage('Install Terraform') {
            steps {
                script {
                    // Kiểm tra và cài đặt Terraform nếu cần
                    sh '''
                        if ! command -v terraform &> /dev/null; then
                            echo "Terraform not found, installing..."
                            curl -sL https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_amd64.zip -o terraform.zip
                            unzip terraform.zip
                            chmod +x terraform
                            mv terraform /usr/local/bin/
                        else
                            echo "Terraform already installed."
                        fi
                    '''
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
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${env.WORKING_DIRECTORY}") {
                    // Sử dụng file kế hoạch đã tạo để triển khai
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Xóa workspace sau khi hoàn tất build
        }
        success {
            echo 'Infrastructure deployed successfully!'
        }
        failure {
            echo 'Deployment failed. Please check the logs for details.'
        }
    }
}
