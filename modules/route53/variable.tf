variable "records_map" {
  description = "Map of records to create"
  type = map(object({
    name  = string
    type  = string
    ttl   = number
    value = string
  }))
}

variable "zone_id" {
  type = string
}

variable "ami_id_dev" {
  type        = string
  description = "AMI ID for dev environment"
}

variable "ami_id_prod" {
  type        = string
  description = "AMI ID for prod environment"
}
