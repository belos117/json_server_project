terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "henkel_solutions"

    workspaces {
      name = "json-server"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "{{secrets.AWS_ACCESS_KEY}}"
  secret_key = "{{secrets.AWS_SECRET_KEY}}"
}
