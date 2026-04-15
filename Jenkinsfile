pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source...'
            }
        }

        stage('Docker Version') {
            steps {
                sh 'docker version'
            }
        }
    }
}
