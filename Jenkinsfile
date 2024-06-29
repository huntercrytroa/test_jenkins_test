pipeline {
    agent {
        docker {
            image 'docker:19.03.12' // ใช้ Docker image ที่มี Docker ติดตั้งอยู่
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

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
                    docker --version
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
                    docker --version
                    # Example test command
                    # npm test
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Stop any container using port 3000
                sh '''
                    echo "Stopping any container using port 3000..."
                    docker --version
                    docker ps -q --filter "publish=3000" | grep -q . && docker stop $(docker ps -q --filter "publish=3000")
                '''
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
    }
    post {
        always {
            echo 'Cleaning up...'
            // Clean up dangling images
            sh '''
                echo "Cleaning up dangling images..."
                docker image prune -f
            '''
        }
    }
}
