#- General
variable region {
  description = "aws region"
  type        = string

  default     = "us-east-2"
}

variable bucket_name {
  description = "bucket name"
  type        = string

  default     = "gondor-bucket"
}

variable tags {
  description   = "bucket tags"
  type          = object({
    Terraform   = string
    Environment = string
    Owner       = string
  })

  default       = {
    Terraform   = "true"
    Environment = "poc"
    Owner       = "<owner>"
  }
}