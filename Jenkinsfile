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
                    echo "Running terraform init for VPC module"
                    sh 'terraform init -upgrade'
                }
                dir('root_module/webserver') {
                    echo "Running terraform init for Webserver module"
                    sh 'terraform init -upgrade'
                }
            }
        }
        stage('terraform plan') {
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform plan for VPC module"
                    sh 'terraform plan'
                }
                dir('root_module/webserver') {
                    echo "Running terraform plan for Webserver module"
                    sh 'terraform plan'
                }
            }
        }
        stage('terraform fmt') {
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform fmt for VPC module"
                    sh 'terraform fmt'
                }
                dir('root_module/webserver') {
                    echo "Running terraform fmt for Webserver module"
                    sh 'terraform fmt'
                }
            }
        }
        stage('terraform apply') {
            when {
                expression { params.SELECT_CHOICE == "apply" }
            }
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform apply for VPC module"
                    sh 'terraform apply --auto-approve'
                }
                dir('root_module/webserver') {
                    echo "Running terraform apply for Webserver module"
                    sh 'terraform apply --auto-approve'
                }
            }
        }
        stage('terraform destroy') {
            when {
                expression { params.SELECT_CHOICE == "destroy" }
            }
            steps {
                dir('root_module/vpc') {
                    echo "Running terraform destroy for VPC module"
                    sh 'terraform destroy --auto-approve'
                }
                dir('root_module/webserver') {
                    echo "Running terraform destroy for Webserver module"
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
