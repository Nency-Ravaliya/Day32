provider "aws" {
  region  = "us-west-1"
  profile = "dev"
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "nency-unique-key"  # This name is for reference within AWS, it doesn’t need to match the filename
  public_key = var.public_key
}

locals {
  private_key = file("~/.ssh/nency_key_pair")
}

# Define a security group for SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access to the EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP; adjust as needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nency-allow_ssh"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key_pair.key_name  
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"  # Change based on your AMI
      private_key = local.private_key
      host        = self.public_ip
    }
  }

  tags = {
    Name = "nency-EC2Instance"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "nency-bucket-s3"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}
