# Advanced Terraform with Provisioners, Modules, and Workspaces

## Project Overview

This project demonstrates the use of Terraform modules, provisioners, and workspaces to deploy a basic infrastructure on AWS. The infrastructure includes an EC2 instance and an S3 bucket, managed through a custom Terraform module. Terraform provisioners are used to perform post-deployment actions on the EC2 instance, and Terraform workspaces are implemented to manage separate environments (e.g., dev and prod).

## Table of Contents

1. [Project Structure](#project-structure)
2. [Module Development](#module-development)
3. [Main Terraform Configuration](#main-terraform-configuration)
4. [Provisioner Implementation](#provisioner-implementation)
5. [Workspace Management](#workspace-management)
6. [Validation and Testing](#validation-and-testing)
7. [Resource Cleanup](#resource-cleanup)
8. [Documentation](#documentation)

## Project Structure

```plaintext
├── main.tf
├── terraform.tfvars
├── variables.tf
├── outputs.tf
├── modules
│   └── aws_infrastructure
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
└── README.md
```



## Output:

![image](https://github.com/user-attachments/assets/734d7c16-0aa0-457d-9d12-188c96528aaf)
![image](https://github.com/user-attachments/assets/cf6ffe99-425a-4298-a3dc-9349c089fd73)
![image](https://github.com/user-attachments/assets/ce15cb61-c547-49e2-8642-85fa8ef4ef71)
![image](https://github.com/user-attachments/assets/6910115e-d2d5-495b-81be-c64025c335a1)
![image](https://github.com/user-attachments/assets/893bae68-e810-481e-bc40-dbb82445481f)
![image](https://github.com/user-attachments/assets/a87e5629-8fd8-4a13-8a5f-eb851c8f68c3)
![image](https://github.com/user-attachments/assets/93b3b7ce-c032-4905-b6e4-bc14eda585fa)
![image](https://github.com/user-attachments/assets/f14256dc-57cf-40b9-b847-84c94309935a)
![Uploading image.png…]()







