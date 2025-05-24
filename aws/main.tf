provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "divyansh-de-tf-state-bucket"
    key            = "dev/data-pipeline/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}


