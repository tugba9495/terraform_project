pipeline {
    agent any
    parameters {
        choice (
            choices: ['apply','destroy'],
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

        
    }
}