pipeline {
    agent any

    environment {
        FRONTEND_IMAGE = "app-frontend"
        BACKEND_IMAGE  = "app-backend"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source...'
            }
        }

        stage('Build Frontend Image') {
            steps {
                sh '''
                docker build -t $FRONTEND_IMAGE ./app-frontend
                '''
            }
        }

        stage('Build Backend Image') {
            steps {
                sh '''
                docker build -t $BACKEND_IMAGE ./app-backend
                '''
            }
        }
    }
}
