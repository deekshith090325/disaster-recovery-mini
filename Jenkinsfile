pipeline {
    agent any

    stages {
        stage('Checkout Repository') {
            steps {
                git branch: 'main', url: https://github.com/deekshith090325/disaster-recovery-mini.git'
            }
        }

        stage('Simulate Disaster Recovery') {
            steps {
                echo 'Starting Disaster Recovery Automation...'
                bat '''
                echo Simulating Disaster Recovery...
                dir
                echo Backup completed successfully!
                '''
            }
        }

        stage('Verification') {
            steps {
                echo 'Verifying Recovery...'
                bat '''
                echo Verification completed successfully!
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Disaster Recovery Successful!'
        }
        failure {
            echo '❌ Disaster Recovery Failed!'
        }
    }
}
