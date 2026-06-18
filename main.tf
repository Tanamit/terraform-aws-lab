terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0a6a4c524bc36f8f1"
  instance_type = "t3.micro"

  tags = {
    Name        = "terraform-web-server"
    Environment = "learning"
    ManagedBy   = "terraform"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
