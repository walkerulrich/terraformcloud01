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
resource "aws_instance" "vm" {
  ami = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name = "terraformcloud"
 tags = {
  Name = "vm-walker"
 } 

}
