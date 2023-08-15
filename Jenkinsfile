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
        stage('terraform plan') {
            steps {
                 dir('root_module/vpc') {
                    echo "running terraform plan"
                    sh 'terraform plan'
                 }
                
            }
        }
        stage('terraform fmt') {
            steps { 
                dir('root_module/vpc') {
                    echo "running terraform fmt"
                    sh 'terraform fmt'
                }
        
    
        }



    

        
    }
}