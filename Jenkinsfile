#!/bin/bash
set -e  

echo "🔹 Running Deploy Script"

chmod +x build.sh

./build.sh

if [ "$(docker ps -aq -f name=task2_container)" ]; then
    echo "🛑 Stopping and removing existing container 'task2_container'..."
    docker stop task2_container || true
    docker rm -f task2_container || true
else
    echo "✅ No existing container 'task2_container' found."
fi

echo "DOCKER_USERNAME: $DOCKER_USERNAME"
if [ -z "$DOCKER_PASSWORD" ]; then
    echo "❌ ERROR: DOCKER_PASSWORD is empty!"
    exit 1
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker tag lalithambigai011004/miniproject lalithambigai011004/miniproject-devops
docker push lalithambigai011004/miniproject-devops
# Run the container with the new image
docker run -d -p 8085:80 --name task2_container lalithambigai011004/task2

echo "✅ Docker image pushed and container started successfully!"
