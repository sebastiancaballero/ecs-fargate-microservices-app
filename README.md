# 🚀 ECS Fargate Microservices Application (Production-Style)

## 📌 Overview
This project demonstrates a **production-style microservices deployment on AWS** using:

- ECS Fargate (serverless containers)
- Application Load Balancer (ALB)
- Terraform (Infrastructure as Code)
- Jenkins (CI/CD pipeline)

The goal of this project is to simulate how real-world applications are:
- Built locally
- Containerized
- Deployed to the cloud
- Scaled and automated

---

## 🧱 Architecture (High-Level)

![Full Architecture Overview](erasor_architecture_diagram.png)

This project implements a fully automated CI/CD pipeline for deploying a frontend and backend application on AWS using Docker, Terraform, Jenkins, Amazon ECR, ECS Fargate, Application Load Balancer, and CloudWatch-based scaling.
---

## ⚙️ Tech Stack

- AWS ECS Fargate
- Application Load Balancer (ALB)
- Docker
- Terraform
- Jenkins
- JavaScript (Frontend + Backend)

---

## 🧪 Phase 1: Local Setup & Validation

### 🎯 Goal
Verify the application works locally before containerization and deployment.

### ✅ Steps Completed

- Cloned application repository
- Installed frontend and backend dependencies
- Configured frontend to communicate with backend (`localhost:8080`)
- Successfully ran backend service
- Successfully ran frontend service

### 📸 Proof

#### Project Structure
![Project Structure](phase1_repo_structure.png)

#### Frontend Successfully Rendering Backend Data
![Frontend Backend Success](frontend_backend_success.png)

#### Backend API Responding Correctly
![Backend API Response](backend_api_response.png)

---

## 💡 Why This Matters (Real-World Impact)

Before deploying any application to production, engineers must:

- Validate functionality locally
- Ensure services communicate correctly
- Catch issues early before cloud deployment

This reduces:
- Deployment failures
- Debugging time in production
- Infrastructure costs

---

## 🚧 Next Steps

- Containerize application using Docker
- Push images to Amazon ECR
- Deploy using ECS Fargate
- Implement CI/CD pipeline with Jenkins
---

## 📦 Phase 2: Containerization & Local Testing

### 🎯 Goal
Containerize the frontend and backend applications and validate container-to-container communication.

### 📸 Proof

#### Backend Docker Image Build
![Backend Build](backend_build.png)

#### Frontend Docker Image Build
![Frontend Build](frontend_build.png)

#### Backend Dockerfile
![Backend Dockerfile](phase2_backend_dockerfile.png)

#### Frontend Dockerfile
![Frontend Dockerfile](phase2_frontend_dockerfile.png)

#### Containers Running Locally
![Containers Running](phase2_containers_running.png)

#### Containerized Frontend Successfully Communicating with Backend
![Frontend Container Working](phase2_containerized_frontend_working.png)

### ✅ Result
Built Docker images for both frontend and backend services, ran them as containers locally, and verified successful communication between services via exposed ports.
---

## 🏗️ Phase 3: Infrastructure Provisioning (Terraform)

### 🎯 Goal
Provision AWS infrastructure for container deployment using Terraform and validate that the core ECS Fargate resources were created successfully.

### 📸 Proof

#### Terraform Project Structure
![Terraform Structure](phase3_terraform_structure.png)

#### Terraform Module Wiring in `main.tf`
![Module Wiring](phase3_module_wiring_main_tf.png)

#### Successful Terraform Apply
![Terraform Apply Success](phase3_terraform_apply_success.png)

#### ECS Cluster Created
![ECS Cluster Created](phase3_ecs_cluster_created.png)

#### ECS Services Created
![ECS Services Created](phase3_ecs_services_created.png)

#### Application Load Balancer Created
![Load Balancer Created](phase3_load_balancer_created.png)

#### ECS Tasks Running
![Running Tasks](phase3_running_tasks.png)

#### Service Scaling Configuration
![Service Scaling Config](phase3_service_scaling_config.png)

### ✅ Result
Provisioned AWS infrastructure with Terraform, created the ECS cluster, services, load balancer, and scaling configuration, and verified that application tasks were running successfully in the target environment.
---

## 🔁 Phase 4: CI/CD Pipeline Setup (Jenkins)

### 🎯 Goal
Set up a Jenkins server on AWS EC2 and configure a CI/CD pipeline to automate build and deployment processes.

### 📸 Proof

#### Jenkins EC2 Instance Running
![Jenkins EC2 Running](phase4_jenkins_ec2_running.png)

#### Jenkins Initial Unlock Screen
![Jenkins Unlock](phase4_jenkins_unlock_screen.png)

#### Jenkins EC2 Remote Access
![Jenkins Remote Access](phase4_jenkins_ec2_remote_access.png)

#### GitHub Repository Connected to Jenkins
![GitHub Connection](phase4_github_connection.png)

#### Jenkins Pipeline Stages
![Pipeline Stages](phase4_pipeline_stages.png)

#### Docker Build from Jenkins Pipeline
![Docker Build](phase4_docker_build.png)

#### ECS Deployment Update Triggered by Pipeline
![ECS Deployment](phase4_ecs_deployment_update.png)

#### ECS Tasks Running After Deployment
![ECS Tasks Running](phase4_ecs_running_tasks.png)

### ✅ Result
Provisioned a Jenkins server on EC2, integrated it with the GitHub repository, and successfully implemented a CI/CD pipeline that builds Docker images and deploys updated services to ECS.
