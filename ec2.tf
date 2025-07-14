
terraform {
  backend "s3" {
    bucket = "kushal-tf-backend"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}


# IAM Role for EC2
resource "aws_iam_role" "ec2_role" {
  name = "ec2-s3-writer-role-kushal"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
    tags = {
    Name        = "ec2-s3-writer-role-kushal"
    Creator       = "kushalsubedi"
  }
}

# IAM Policy allowing PutObject to the S3 bucket
resource "aws_iam_role_policy" "allow_s3_get_put_list" {
  name = "AllowS3GetPutList"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "arn:aws:s3:::kushal-ec2-write-only-bucket/*"
      },
      {
        Effect = "Allow"
        Action = "s3:ListBucket"
        Resource = "arn:aws:s3:::kushal-ec2-write-only-bucket"
      }
    ]
  })


}
# Instance Profile to attach role to EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-s3-writer-profile"
  role = aws_iam_role.ec2_role.name
  tags = {
    Name: "kushal-ec2-profile"
    Creator: "kushalSubedi"
  }
}

module "ec2" {
  source         = "./modules/ec2"
  instance_name  = "kushal-ec2"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

}

output "instance_arn" {
  value = module.ec2.instance_arn
}
output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
}






