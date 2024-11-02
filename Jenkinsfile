pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION            = 'us-east-1'
        WORKING_DIRECTORY      = "./Terraform/environments/staging" // Sửa lại đường dẫn đến thư mục làm việc
    }

    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                    dir(env.WORKING_DIRECTORY) { // Sử dụng biến môi trường
                        git "https://github.com/Crypto347/lab1-terraform.git"
                    }
                }
            }
        }

        stage('Plan') {
            steps {
                script {
                    dir(env.WORKING_DIRECTORY) { // Sử dụng biến môi trường
                        sh 'terraform init'
                        sh 'terraform plan -out tfplan'
                        sh 'terraform show -no-color tfplan > tfplan.txt'
                    }
                }
            }
        }

        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                script {
                    def plan = readFile "${env.WORKING_DIRECTORY}/tfplan.txt" // Sử dụng biến môi trường
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply') {
            steps {
                script {
                    dir(env.WORKING_DIRECTORY) { // Sử dụng biến môi trường
                        sh 'terraform apply -input=false tfplan'
                    }
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
