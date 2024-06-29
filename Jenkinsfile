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
                    # ตัวอย่างคำสั่งในการรันเทส
                    # npm test
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Run Docker container
                sh '''
                    echo "Running Docker container..."
                    docker run -d -p 3000:3000 ${DOCKER_IMAGE}
                '''
            }
        }
    }
}
