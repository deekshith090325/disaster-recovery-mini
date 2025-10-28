pipeline {
    agent any

    environment {
        SCRIPTS_DIR = "${WORKSPACE}\\scripts"
        BACKUP_DIR  = "${WORKSPACE}\\backup"
        APP_DIR     = "${WORKSPACE}\\app"
        LOG_DIR     = "${WORKSPACE}\\logs"
    }

    stages {
        stage('Checkout Repository') {
            steps {
                echo "\u001B[34m📦 Checking out project repository...\u001B[0m"
                checkout scm
            }
        }

        stage('Backup Application') {
            steps {
                echo "\u001B[36m🔹 Running backup.bat...\u001B[0m"
                bat "\"${SCRIPTS_DIR}\\backup.bat\""
            }
        }

        stage('Simulate Failure') {
            steps {
                echo "\u001B[33m⚠️ Simulating app failure...\u001B[0m"
                bat "if exist \"${APP_DIR}\\index.html\" del \"${APP_DIR}\\index.html\""
            }
        }

        stage('Restore Application') {
            steps {
                echo "\u001B[36m🔹 Running restore.bat...\u001B[0m"
                bat "\"${SCRIPTS_DIR}\\restore.bat\""
            }
        }

        stage('Health Check') {
            steps {
                echo "\u001B[36m🔹 Running healthcheck.bat...\u001B[0m"
                bat "\"${SCRIPTS_DIR}\\healthcheck.bat\""
            }
        }

        stage('Verification Summary') {
            steps {
                echo "\u001B[32m✅ Disaster Recovery Process Completed Successfully!\u001B[0m"
                bat "type \"${LOG_DIR}\\backup_log.txt\""
                bat "type \"${LOG_DIR}\\restore_log.txt\""
                bat "type \"${LOG_DIR}\\healthcheck_log.txt\""
            }
        }
    }

    post {
        failure {
            echo "\u001B[31m❌ Disaster Recovery Failed! Check logs for errors.\u001B[0m"
        }
        success {
            echo "\u001B[32m✅ All steps completed successfully!\u001B[0m"
        }
    }
}
