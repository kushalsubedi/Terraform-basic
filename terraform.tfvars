creator_name       = "kushalsubedi"
availability_zone  = "us-east-1a"
subnet_id          = "subnet-08d47f32b9526825b"
zone_id            = "Z00234011B4SGOD91FJ38"

environment_config = {
  dev = {
    ami_id        = "ami-05ffe3c48a9991133"
    tags = {
      Environment = "dev"
      Owner       = "kushalsubedi"
    }
    bucket_suffix = "dev"
  }

  prod = {
    ami_id        = "ami-0c7217cdde317cfec"
    tags = {
      Environment = "prod"
      Owner       = "kushalsubedi"
    }
    bucket_suffix = "prod"
  }
}


