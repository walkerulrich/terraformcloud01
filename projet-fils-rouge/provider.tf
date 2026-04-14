terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
terraform {
  cloud {
    organization = "terraformcloud01-org"

    workspaces {
      name = "projet-fils-rouge"
    }
  }
}
provider "aws" {
  region     = "us-east-1"
}