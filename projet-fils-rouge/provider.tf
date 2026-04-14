terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
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