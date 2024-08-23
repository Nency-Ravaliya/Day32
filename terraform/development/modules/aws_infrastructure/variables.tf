variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "public_key" {
  description = "Public key for SSH access"
  type        = string
}

variable "private_key" {
  description = "Private key for SSH access"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the instance will be deployed"
  type        = string
}
