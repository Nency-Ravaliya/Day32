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
# Deployment Steps

## 1. Clone the Repository

Clone the GitHub repository to your local machine:

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

## 2. Configure AWS Credentials
`aws configure`

You will be prompted to enter your AWS Access Key ID, Secret Access Key, region, and output format.

## 3. Review and Update Variables
Edit the **terraform.tfvars** file to specify your AWS configuration:

```
ami_id          = "ami-xxxxxxxx"  # Replace with your desired AMI ID
instance_type   = "t2.micro"      # EC2 instance type
key_name         = "nency-unique-key"  # Name of your SSH key pair
bucket_name      = "nency1-s3-bucket"  # S3 bucket name
```
## 4. Initialize Terraform
Initialize the Terraform configuration:

`terraform init`

This command initializes the Terraform working directory and downloads necessary plugins.

## 5. Create and Select Workspaces
Create and select the dev and prod workspaces:
```
terraform workspace new dev
terraform workspace new prod
```

Select the workspace you want to work in:

`terraform workspace select dev  `

## 6. Apply Terraform Configuration
Deploy the infrastructure in the selected workspace:

`terraform apply -var-file=terraform.tfvars`

## 7. Verify Deployment
After the deployment completes:

EC2 Instance: Access the EC2 instance's public IP in a web browser to verify that Apache HTTP Server is running.
S3 Bucket: Check the S3 bucket creation and ensure it's listed in the AWS S3 console.


## 8. Check Apache Status
SSH into the EC2 instance and check the Apache status:

`ssh -i ~/.ssh/nency_key_pair ec2-user@<EC2_PUBLIC_IP>`

Once logged in, check Apache status:

`sudo systemctl status httpd`

## 9. Cleanup Resources
To destroy the resources in the current workspace:

`terraform destroy`

Confirm the destruction when prompted. Repeat this for each workspace (dev and prod):

```
terraform workspace select prod
terraform destroy
```

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). See the [LICENSE](LICENSE) file for details.


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







