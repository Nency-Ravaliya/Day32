provider "aws" {
  region  = "us-west-1"
  profile = "dev"
}

data "aws_vpc" "default" {
  default = true
}

module "aws_infrastructure" {
  source        = "./modules/aws_infrastructure"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  public_key    = file("~/.ssh/nency_key_pair.pub")
  private_key   = file("~/.ssh/nency_key_pair")
  bucket_name   = var.bucket_name
  vpc_id        = data.aws_vpc.default.id
}

output "ec2_public_ip" {
  value = module.aws_infrastructure.ec2_public_ip
}

output "s3_bucket_arn" {
  value = module.aws_infrastructure.s3_bucket_arn
}
