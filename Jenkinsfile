def jenkinsid = slackUserIdFromEmail('tuba_7655@icloud.com')

def getEnvironment() {
    def validEnvironments = ['vpc', 'webserver']
    for (env in validEnvironments) {
        if (env in params.ENVIRONMENT) {
            return env
        }
    }
    error "Invalid environment specified: ${params.ENVIRONMENT}"
}

def getStateFile(environment, command) {
    def action = command == "apply" ? "webserver" : "vpc"
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
            choices: ['vpc', 'webserver'],
            description: 'Select environment',
            name: 'ENVIRONMENT'
        )
    }
    stages {
        // ... (other stages remain the same)

        stage('terraform apply') {
            when {
                expression { params.SELECT_CHOICE == "apply" }
            }
            steps {
                script {
                    runTerraformCommand("apply")
                }
            }
        }
        stage('terraform destroy') {
            when {
                expression { params.SELECT_CHOICE == "destroy" }
            }
            steps {
                script {
                    runTerraformCommand("destroy")
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
