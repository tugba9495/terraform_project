def jenkinsid = slackUserIdFromEmail('tuba_7655@icloud.com')

def getEnvironment() {
    def validEnvironments = ['vpc', 'webserver' 'rds']
    for (env in validEnvironments) {
        if (env in params.ENVIRONMENT) {
            return env
        }
    }
    error "Invalid environment specified: ${params.ENVIRONMENT}"
}

def getStateFile(environment, command) {
    def action = command == "apply" ? "webserver" : "vpc" : "rds"
    return "terraform_state/${environment}/terraform_${action}.tfstate"
}

def runTerraformCommand(command) {
    def environment = getEnvironment()
    def stateFile = getStateFile(environment, command)
    echo "Running terraform $command for ${environment.capitalize()} module"
    sh "terraform $command -auto-approve -state=$stateFile"
}

pipeline {
    agent any
    parameters {
        choice (
            choices: ['apply', 'destroy'],
            description: 'terraform choice',
            name: 'SELECT_CHOICE'
        )
        choice (
            choices: ['vpc', 'webserver' , 'rds'],
            description: 'Select environment',
            name: 'ENVIRONMENT'
        )
    }
    stages {
        stage('terraform init') {
            steps {
                script {
                    def environment = getEnvironment()
                    dir("root_module/${environment}") {
                        echo "Running terraform init for ${environment.capitalize()} module"
                        sh 'terraform init -upgrade'
                    }
                }
            }
        }

        stage('terraform plan') {
            steps {
                script {
                    def environment = getEnvironment()
                    dir("root_module/${environment}") {
                        echo "Running terraform plan for ${environment.capitalize()} module"
                        sh 'terraform plan'
                    }
                }
            }
        }
        

        stage('terraform apply') {
            when {
                expression { params.SELECT_CHOICE == "apply" }
            }
            steps {
                script {
                    def environment = getEnvironment()
                    dir("root_module/${environment}") {
                        echo "Running terraform plan for ${environment.capitalize()} module"
                        sh 'terraform apply -auto-approve'
                    }
                    
                }
            }
        }
        stage('terraform destroy') {
            when {
                expression { params.SELECT_CHOICE == "destroy" }
            }
            steps {
                script {
                    def environment = getEnvironment()
                    dir("root_module/${environment}") {
                        echo "Running terraform plan for ${environment.capitalize()} module"
                        sh 'terraform destroy -auto-approve'
                    }
                    
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
