# Azure Container Infrastructure with Terraform

![CD Pipeline](https://github.com/Sonelooo77/devops-flask-microservice-IaC/actions/workflows/cd.yml/badge.svg)

This repository provisions an automated cloud environment on Microsoft Azure using Terraform. It deploys the companion Flask monitoring microservice into Azure Container Instances within an isolated Resource Group.

## Architecture Overview

The declared infrastructure runs entirely on serverless container instances to minimize operating system overhead:
- Cloud Provider: Microsoft Azure
- IaC Tool: Terraform (azurerm provider)
- Region: North Europe (northeurope)
- Compute: Azure Container Instances (ACI)
- Network: Public IP with custom DNS label and exposed port for HTTP traffic
- State Management: Remote backend hosted on Azure Blob Storage with automated blob lease locking

## Continuous Delivery Pipeline

The continuous deployment workflow is driven by GitHub Actions and implements an ephemeral testing pattern to eliminate ongoing cloud costs:

1. Initialization: Terraform initializes providers using an Azure Service Principal authenticated via secrets.
2. Provisioning: Terraform executes apply using the image tag variable supplied from terraform.tfvars.
3. Smoke Testing: The workflow retrieves the container public URL from Terraform outputs and queries the health endpoint with strict timeouts until a valid response is returned.
4. Teardown: Terraform systematically executes destroy at the end of the job, regardless of the test outcome, preventing unnecessary billing.

## Repository Structure

- main.tf: Declares the resource group, container group, registry credentials, and outputs.
- variables.tf: Defines configuration variables including container image tag and ports.
- terraform.tfvars: Stores active environment values updated by the application pipeline.
- .github/workflows/cd.yml: Contains the automated ephemeral testing and destruction pipeline.
