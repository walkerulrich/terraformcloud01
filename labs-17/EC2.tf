terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }  
}
terraform {
  required_version = "1.14.8"

  cloud {
    
    organization = "terraformclouds-org"

    workspaces {
      name = "terraformcloud01-workspace"
    }
  }
}

provider "aws" {
    region     = "us-east-1"
    
}
# Ajoutez ceci dans EC2.tf ou dans un nouveau variables.tf
variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

resource "aws_instance" "vm" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = var.instance_type  # ← utilise la variable
  key_name      = "terraformcloud"
  tags = {
    Name = "vm-walker"
  }
}
