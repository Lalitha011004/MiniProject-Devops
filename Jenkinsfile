pipeline {
    agent any 

    stages {
        stage('Build and Push Docker Image') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
