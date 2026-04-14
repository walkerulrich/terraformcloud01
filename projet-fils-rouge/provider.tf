terraform {
  required_version = "1.14.8"

  cloud {
    
    organization = "terraformclouds-org"

    workspaces {
      name = "projet-fils-rouge_continuons"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}