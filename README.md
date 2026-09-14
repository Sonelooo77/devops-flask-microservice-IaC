# Azure Infrastructure with Terraform #

![CD Pipeline](https://github.com/Sonelooo77/devops-flask-microservice-IaC/actions/workflows/cd.yml/badge.svg)

This repository provisions an automated Cloud infrastructure on **Microsoft Azure** using **Terraform** in order to deploy my  containerized web microservice and other potential microservices. This deployment is carried out using **Azure Container Instances (ACI)** in an isolated Resource Group.

## Architectural Overview

This architecture leverages serverless container execution:
```text
 ┌─────────────────────────────────────────────────────────────┐
 │ Azure Resource Group (rg-devops-lab-test)                   │
 │                                                             │
 │   ┌───────────────────────────────────────────────────────┐ │
 │   │ Azure Container Instance (ACI)                        │ │
 │   │  - Container: sonelo77/devops-flask-api:1.0           │ │
 │   │  - Spec: 0.5 CPU / 1.0 GB RAM                         │ │
 │   │  - Exposed: TCP 5000 (HTTP)                           │ │
 │   │  - FQDN: [http://app-devops-sonelo-77.northeurope]    │ │
 │   └───────────────────────────────────────────────────────┘ │
 └─────────────────────────────────────────────────────────────┘
```

This architecture is designed to integrate directly with automated CD pipelines for GitOps workflows.
