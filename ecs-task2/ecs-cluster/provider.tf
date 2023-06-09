terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }

  # backend "s3" {
  #   bucket = "terraform-state-bucket"
  #   key = "state.tfstate"
  # }

  # Above I created a Bucket on AWS S3 to store the Terraform State remotely. It's not required but, it'll make our life easier if someone else needs to maintain this infrastructure. 
  # Terraform will keep the state in an s3 bucket under a state.tfstate key.
  # But I have commented it for future and flexibility.
}

provider "aws" {
  # region = var.aws_region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key

  # no need to specify my region, access_key, and secret key, cause they are already set in ~/.aws/credentials and ~/.aws/config files. 
  # But I have commented them for future and flexibility.
}