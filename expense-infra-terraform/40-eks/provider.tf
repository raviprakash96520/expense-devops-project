terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.28.0, < 7.0.0"
    }
  }

  backend "s3" {
    bucket         = "expense-infra-state-dev"
    key            = "expense-eks-dev"
    region         = "us-east-1"
    dynamodb_table = "expense-locking-dev"
  }
}

provider "aws" {
  region = "us-east-1"
}