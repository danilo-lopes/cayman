#- General
variable region {
  description = "aws region"
  type        = string

  default     = "us-east-2"
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

#- VPC
variable vpc_name {
  description = "vpc name"
  type        = string

  default     = "gondor-vpc"
}

variable vpc_cidr {
  description = "vpc cidr"
  type        = string

  default     = "172.16.0.0/21"
}

variable vpc_public_subnets_cidr {
  description = "public subnets cidr"
  type        = list(string)

  default     = [
    "172.16.2.0/24",
    "172.16.3.0/24"
  ]
}

variable vpc_private_subnets_cidr {
  description = "private subnets cidr"
  type        = list(string)

  default     = [
    "172.16.0.0/24",
    "172.16.1.0/24"
  ]
}

variable k8s_cluster_name {
  description = "k8s cluster name"
  type        = string

  default     = "gondor-kubernetes-cluster"
}
