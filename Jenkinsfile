pipeline {
    agent any

    stages {
        stage('Checkout Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/deekshith090325/disaster-recovery-mini.git'
            }
        }

        stage('Simulate Disaster Recovery') {
            steps {
                echo 'Starting Disaster Recovery Automation...'
                sh 'chmod +x scripts/disaster_recovery.sh'
                sh './scripts/disaster_recovery.sh'
            }
        }

        stage('Verification') {
            steps {
                echo 'Verifying recovery files...'
                sh 'ls restore'
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
