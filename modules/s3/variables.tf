variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default = "kushal-tf-bucket"
}

variable "creator_name" {
  description = "Creator of the S3 bucket"
  type        = string
}
variable "ec2_role_arn" {
  description = "IAM Role ARN to allow put access"
  type        = string
}
