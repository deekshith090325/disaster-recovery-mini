pipeline {
    agent any

    stages {
        stage('Backup') {
            steps {
                script {
                    bat 'scripts\\backup.bat'
                }
            }
        }

        stage('Restore') {
            steps {
                script {
                    bat 'scripts\\restore.bat'
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    bat 'scripts\\healthcheck.bat'
                }
            }
        }

        stage('Generate Report') {
            steps {
                script {
                    powershell 'powershell -ExecutionPolicy Bypass -File scripts\\generate_report.ps1'
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'reports/recovery_report.html', fingerprint: true
            echo '✅ Build finished. Report archived.'
        }
    }
}
