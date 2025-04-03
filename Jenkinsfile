pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "lalithambigai011004/task2"
        CONTAINER_NAME = "task2_container"
        DOCKER_USERNAME = credentials('Lalithambigai')  // Replace with Jenkins Credential ID
        DOCKER_PASSWORD = credentials('Lali_0121')  // Replace with Jenkins Credential ID
    }

    stages {
        stage('Checkout') {
            steps {
                echo "🔹 Checking out repository..."
                git branch: 'main', url: 'https://github.com/Lalitha011004/MiniProject-Devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "🔹 Building Docker Image..."
                    sh '''
                        chmod +x build.sh
                        ./build.sh
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo "🔹 Logging into Docker Hub..."
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker tag $DOCKER_IMAGE lalithambigai011004/miniproject-devops
                        docker push lalithambigai011004/miniproject-devops
                    '''
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    echo "🔹 Stopping and removing existing container..."
                    sh '''
                        if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
                            docker stop $CONTAINER_NAME || true
                            docker rm -f $CONTAINER_NAME || true
                        fi
                        echo "✅ No existing container found."
                        
                        echo "🔹 Running new container..."
                        docker run -d -p 8085:80 --name $CONTAINER_NAME $DOCKER_IMAGE
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment completed successfully!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
