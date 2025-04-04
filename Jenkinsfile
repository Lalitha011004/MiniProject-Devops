pipeline {
    agent any 

        states {
            state('Build and Push Docker Image') {
                steps {

                    sh 'chmod +x deploy.sh'


                    sh '.deploy.sh'
                }
            }
        }
}
