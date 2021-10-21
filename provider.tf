# Required for 13.0 and later
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.14.9"
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
