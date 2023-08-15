def jenkinsid = slackUserIdFromEmail('tuba_7655@icloud.com')

pipeline {
    agent any
    parameters {
        choice (
            choices: ['apply', 'destroy'],
            description: 'terraform choice',
            name: 'SELECT_CHOICE'
        )
    }
    stages {
        stage('terraform init') {
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform init"
                    sh 'terraform init -upgrade'
                }
            }
        }
        stage('terraform plan') {
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform plan"
                    sh 'terraform plan'
                }
            }
        }
        stage('terraform fmt') {
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform fmt"
                    sh 'terraform fmt'
                }
            }
        }
        stage('terraform apply') {
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform apply"
                    sh 'terraform apply --auto-approve'
                }
            }
        }
        stage('terraform destroy') {
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform destroy"
                    sh 'terraform destroy --auto-approve'
                }
            }
        }
        
    }
    post {
        always {
            echo '### Clean Workplaces ###'
            cleanWs()
        }
        success {
            echo "Pipeline executed successfully!"
            slackSend(color: "good", message: "<$jenkinsid> Terraform configuration is successful")
        }
        failure {
            echo "Pipeline execution failed!"
            slackSend(color: "danger", message: "<$jenkinsid> Terraform configuration is not successful")
        }
    }
}
