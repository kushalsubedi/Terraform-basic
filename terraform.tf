terraform {
  required_version = ">= 1.5.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"

    }
  }
  #   backend "s3" {
  #   bucket = "kushal-tf-bucket"
  #   key    = "terraform.tfstate"
  #   region = "us-east-1"
  #
  # }
}
