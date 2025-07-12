variable ami{
description = "The id of ami (ex:ubuntu..)"
  type        = string
  default     = "ami-05ffe3c48a9991133"

}
variable instance_type {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"

}
variable availability_zone{
  description = "Your aws vpc's availibility_zone"
  type = string
  default = "us-east-1a"
}
variable instance_name{
  description = "The name of your EC2 instance"
  type = string
  default = "kushal-ec2"
}
variable creator_name {
  description = "The name of the creator, such as user of that account"
  type = string
  default = "kushalsubedi"

}
variable subnet_id {
  description = "This is the subnet id for the EC2"
  default = "subnet-08d47f32b9526825b"
}

variable sg_id {
  description = "sg id"
  type = list(string)
  default = ["sg-00db2ef17f910dcd3"]
}

variable s3_bucket_arn {
  type    = string
  default = ""
  description = "ARN of the S3 bucket to allow PutObject access"
}

variable iam_instance_profile {
  description = "The name of the IAM instance profile to attach to the EC2 instance"
  type        = string
}
