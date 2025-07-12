terraform {
  backend "s3" {
    bucket = "kushal-tf-backend"
    key    = "s3/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "ec2" {
  backend = "s3"
  config = {
    bucket = "kushal-tf-backend"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}

module "s3" {
  source        = "./modules/s3"
  bucket_name   = "kushal-ec2-write-only-bucket"
  creator_name  = "kushalsubedi"
  ec2_role_arn    = data.terraform_remote_state.ec2.outputs.ec2_role_arn

}

resource "aws_s3_bucket_policy" "allow_ec2_put" {
  bucket = module.s3.bucket_name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowPutFromEC2Role",
        Effect    = "Allow",
        Principal = {
          AWS = data.terraform_remote_state.ec2.outputs.ec2_role_arn
        },
        Action    = [
          "s3:PutObject"
        ],
        Resource  = "${module.s3.bucket_arn}/*"
      }
    ]
  })
}


