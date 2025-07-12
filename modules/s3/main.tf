resource "aws_s3_bucket" "kushal_tf_bucket" {
  bucket = var.bucket_name

  tags = {
    Name    = var.bucket_name
    Creator = var.creator_name
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.kushal_tf_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


