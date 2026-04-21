## 🧠 System Design & Engineering Thinking

### 🎯 Project Goal

This project was designed to simulate a real-world production deployment, not just demonstrate tool usage.

The objective was to build a scalable, automated microservices system that reflects how modern cloud infrastructure is designed, deployed, and operated in a production environment.

- **Evaluate migration to Kubernetes (EKS) with Horizontal Pod Autoscaler (HPA)**  
  For more advanced orchestration and scaling control, a future version of this system could migrate to EKS and use Kubernetes HPA for pod-level autoscaling based on CPU, memory, or custom metrics.

---

## ⚙️ Key Design Decisions

### Why ECS Fargate (instead of EC2)
- Eliminates server management (no patching, scaling groups, or OS maintenance)
- Allows focus on application and infrastructure design rather than instance management
- Scales containers automatically based on demand
- Better alignment with modern serverless/container-first architectures

👉 Tradeoff:
- Less control over underlying infrastructure
- Potentially higher cost at scale compared to EC2

---

### Why Jenkins (instead of GitHub Actions)
- Full control over pipeline configuration and execution
- Simulates enterprise environments where Jenkins is still widely used
- Allows deeper understanding of CI/CD internals

👉 Tradeoff:
- Requires infrastructure management (EC2 instance, setup, maintenance)
- More complex than managed CI/CD solutions

---

### Why Application Load Balancer (ALB)
- Distributes traffic across containers for high availability
- Enables dynamic routing to ECS services
- Acts as a stable entry point for the system

👉 Tradeoff:
- Single entry point (can become a bottleneck if not designed with redundancy)

---

## 📈 Business Impact

This architecture is designed to:

- **Reduce operational overhead**  
  → No server management with Fargate

- **Improve scalability**  
  → Auto scaling responds to real-time demand

- **Increase deployment speed**  
  → CI/CD pipeline automates build and deployment

- **Improve reliability**  
  → Load balancing + container orchestration ensures service availability

---

## ⚠️ What Would Break First (Production Reality)

- **ALB as a single entry point**  
  → Could become a bottleneck without multi-region setup

- **No caching layer**  
  → Backend could become overwhelmed under heavy read traffic

- **Scaling delay**  
  → ECS scaling is reactive, not instantaneous

- **Jenkins dependency**  
  → If Jenkins EC2 fails, deployments stop

- **Limited observability**  
  → No centralized logging/monitoring dashboards yet

---

### 🚀 Future Improvements

- **Blue/Green Deployments**  
  Implement blue/green deployment strategy to eliminate downtime and reduce deployment risk during releases.

- **AWS Secrets Manager Integration**  
  Replace hardcoded or environment-based secrets with AWS Secrets Manager for improved security and centralized secret rotation.

- **Cost Optimization Strategies**  
  Introduce rightsizing, scaling thresholds tuning, and potential migration to mixed compute (Fargate + EC2) to reduce long-term infrastructure costs.

- **Observability & Alerting**  
  Implement CloudWatch dashboards, metrics, and alerts to monitor system health, detect failures early, and improve operational visibility.

---

## 🧠 Engineering Mindset

This project focuses on:

- Designing systems, not just deploying them  
- Understanding tradeoffs between tools and architectures  
- Thinking in terms of scalability, reliability, and cost  
- Validating real-world behavior through load testing and scaling  

The goal is to demonstrate the ability to think and operate as a Cloud/DevOps Engineer in a production environment.
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

## ⚙️ Phase 5: CI/CD Pipeline (Jenkinsfile + Automated Deployment)

### 📸 Proof

#### Jenkinsfile Pipeline Code
![Jenkinsfile Code](phase5_jenkinsfile_code.png)

#### Pipeline from SCM Configuration
![Pipeline SCM Config](phase5_pipeline_from_scm_config.png)

#### Script Path Configuration
![Script Path](phase5_script_path_pipeline_config.png)

#### Pipeline Build History
![Pipeline Build History](phase5_pipeline_build_history.png)

#### Successful Pipeline Run
![Successful Pipeline Run](phase5_successful_pipeline_run.png)

#### ECS Deployment Success
![ECS Deployment Success](phase5_ecs_deployment_success.png)

#### ECS Deployment History
![ECS Deployment History](phase5_ecs_deployment_history.png)
## 📈 Phase 6: Scaling, Monitoring & Full System Validation

### 📸 Proof

#### CPU Metrics Monitoring
![CPU Metrics](phase5_cpu_metrics.png)

#### Load Test Running
![Load Test Running](phase6_5_load_test_running.png)

#### Scaling Activity
![Scaling Activity](phase6_5_scaling_activity.png)

#### Auto Scaling Configuration
![Auto Scaling Config](phase6_autoscaling_config.png)

#### Backend API Response
![Backend API Response](phase6_backend_api_response.png)

#### Frontend Live Application
![Frontend Live App](phase6_frontend_live_app.png)

#### Full Stack Integration
![Full Stack Integration](phase6_fullstack_integration.png)

#### Final Pipeline Execution
![Final Pipeline Execution](phase6_final_pipeline_execution.png)
## 🚀 Final System Validation

### 📸 Proof

#### Full Stack Application Running
![Frontend Live](phase6_frontend_live_app.png)

#### Backend API Response via Load Balancer
![Backend Response](phase6_backend_api_response.png)

#### End-to-End Integration
![Full Stack](phase6_fullstack_integration.png)

### ✅ What This Demonstrates
- Fully deployed microservices application on AWS ECS Fargate
- Load balancer routing traffic to containerized services
- CI/CD pipeline automating deployments
- Application scaling under load
- End-to-end system functionality (frontend → backend → infrastructure)
