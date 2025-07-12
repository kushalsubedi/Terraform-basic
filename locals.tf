locals {
  creator_name      = var.creator_name
  availability_zone = var.availability_zone

  environment_name = terraform.workspace == "prod" ? "prod" : "dev"

  env_config    = var.environment_config[local.environment_name]
  ami_id        = local.env_config.ami_id
  bucket_suffix = local.env_config.bucket_suffix
  bucket_name   = "kushal-tf-bucket-${local.bucket_suffix}"

}

