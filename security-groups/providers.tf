terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
    backend "s3" {
    # bucket         = "rancho-backend"
    # key            = "ec2.tfstate"
    # region         = "us-east-1"
    # dynamodb_table = "terraform_locks"
  }
}