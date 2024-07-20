pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my_app'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/huntercrytroa/test_jenkins_test.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                // Build Docker image
                sh '''
                    echo "Building Docker image..."
                    docker build -t ${DOCKER_IMAGE} .
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                sh '''
                    echo "Running tests..."
                    # Example test command
                    # npm test
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Stop any container using port 3000
                script {
                    def containerId = sh(script: "docker ps -q --filter 'publish=3000'", returnStdout: true).trim()
                    if (containerId) {
                        sh "docker stop ${containerId}"
                    } else {
                        echo "No container running on port 3000."
                    }
                }
                // Remove stopped containers
                sh '''
                    echo "Removing stopped containers..."
                    docker container prune -f
                '''
                // Run Docker container
                sh '''
                    echo "Running Docker container..."
                    docker run -d -p 3000:3000 --name my_app_container ${DOCKER_IMAGE}
                '''
            }
        }
        stage('Cleanup') {
            steps {
                echo 'Cleaning up...'
                // Stop and remove the running container
                script {
                    def containerId = sh(script: "docker ps -q --filter 'name=my_app_container'", returnStdout: true).trim()
                    if (containerId) {
                        sh "docker stop ${containerId}"
                        sh "docker rm ${containerId}"
                    } else {
                        echo "No container named my_app_container is running."
                    }
                }
                // Remove Docker image
                sh '''
                    echo "Removing Docker image..."
                    docker rmi ${DOCKER_IMAGE}
                '''
                // Remove unused Docker images
                sh '''
                    echo "Removing unused Docker images..."
                    docker image prune -f
                '''
            }
        }
    }
}
