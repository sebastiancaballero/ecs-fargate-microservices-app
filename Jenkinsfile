pipeline {
    agent any

    environment {
        AWS_REGION      = "us-east-1"
        AWS_ACCOUNT_ID  = "364700381510"

        FRONTEND_IMAGE  = "app-frontend"
        BACKEND_IMAGE   = "app-backend"

        FRONTEND_REPO   = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/app-frontend"
        BACKEND_REPO    = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/app-backend"
        IMAGE_TAG       = "latest"

        ECS_CLUSTER     = "app-cluster"
        FRONTEND_SERVICE = "app-frontend-service"
        BACKEND_SERVICE  = "app-backend-service"
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
                docker build -t $FRONTEND_IMAGE ./frontend
                '''
            }
        }

        stage('Build Backend Image') {
            steps {
                sh '''
                docker build -t $BACKEND_IMAGE ./backend
                '''
            }
        }

        stage('Login to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | \
                docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                '''
            }
        }

        stage('Tag Images') {
            steps {
                sh '''
                docker tag $FRONTEND_IMAGE:latest $FRONTEND_REPO:$IMAGE_TAG
                docker tag $BACKEND_IMAGE:latest $BACKEND_REPO:$IMAGE_TAG
                '''
            }
        }

        stage('Push Frontend Image') {
            steps {
                sh '''
                docker push $FRONTEND_REPO:$IMAGE_TAG
                '''
            }
        }

        stage('Push Backend Image') {
            steps {
                sh '''
                docker push $BACKEND_REPO:$IMAGE_TAG
                '''
            }
        }

        stage('Deploy Frontend Service') {
            steps {
                sh '''
                aws ecs update-service \
                  --cluster $ECS_CLUSTER \
                  --service $FRONTEND_SERVICE \
                  --force-new-deployment \
                  --region $AWS_REGION
                '''
            }
        }

        stage('Deploy Backend Service') {
            steps {
                sh '''
                aws ecs update-service \
                  --cluster $ECS_CLUSTER \
                  --service $BACKEND_SERVICE \
                  --force-new-deployment \
                  --region $AWS_REGION
                '''
            }
        }
    }
}
