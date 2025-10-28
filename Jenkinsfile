pipeline {
    agent any
    triggers { cron("*/2 * * * *") }
    stages {
        stage("Backup") {
            steps { bat "scripts\\backup.bat" }
        }
        stage("Health Check") {
            steps {
                script {
                    def rc = bat(returnStatus: true, script: "scripts\\healthcheck.bat")
                    if (rc != 0) {
                        error("Health check failed - will run restore")
                    }
                }
            }
        }
    }
    post {
        failure { bat "scripts\\restore.bat" }
    }
}
