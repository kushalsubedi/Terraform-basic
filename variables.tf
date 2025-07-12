variable zone_id{
  description = "Zoneid"
  default = "Z00234011B4SGOD91FJ38"

}
variable subnet_id {
  description = "This is Subnet id"
  default = "subnet-08d47f32b9526825b"

}

variable "creator_name" {
  type        = string
  description = "The name of the creator for tagging resources"
  default = "kushalsubedi"
}

variable "availability_zone" {
  type        = string
  description = "The AZ to deploy EC2 instances into"
  default = "us-east-1"
}


variable "environment_config" {
  description = "Environment-specific overrides"
  type = map(object({
    ami_id        = string
    tags          = map(string)
    bucket_suffix = string
  }))
}
