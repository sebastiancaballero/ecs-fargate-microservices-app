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

![Full Architecture Overview](full_architecture_overview.png)

This project implements a full CI/CD-driven AWS deployment workflow for a frontend and backend application using Docker, Terraform, Jenkins, Amazon ECR, ECS Fargate, Application Load Balancer, and CloudWatch-based scaling.
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
