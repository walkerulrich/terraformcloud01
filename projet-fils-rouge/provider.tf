terraform {
  required_version = "1.14.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "terraformclouds-org"

    workspaces {
      name = "projet-fils-rouge_ff"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}