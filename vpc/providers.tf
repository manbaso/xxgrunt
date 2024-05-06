terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
    backend "s3" {
    # bucket         = "rancho-backend"
    # key            = "vpc.tfstate"
    # region         = "us-east-1"
    # dynamodb_table = "terraform_locks"
  }
}


# provider "aws" {
#   region = var.aws_region
# }