pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                branch: 'dev', url: 'https://github.com/huntercrytroa/test_jenkins_test.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                // ใส่คำสั่ง build ของคุณที่นี่
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // ใส่คำสั่ง test ของคุณที่นี่
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // ใส่คำสั่ง deploy ของคุณที่นี่
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
    }
}
