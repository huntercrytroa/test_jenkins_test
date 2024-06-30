pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my_app'
        KUBECONFIG_CREDENTIALS_ID = 'your-kubeconfig-credentials-id'
        DOCKER_REGISTRY = 'my-docker-registry'
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
                // Tag and push Docker image to registry
                sh '''
                    echo "Tagging and pushing Docker image..."
                    docker tag ${DOCKER_IMAGE} ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest
                    docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest
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
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                withCredentials([file(credentialsId: env.KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f deployment.yaml --kubeconfig=$KUBECONFIG'
                }
            }
        }
    }
}
