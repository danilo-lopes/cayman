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

#- EKS
variable cluster_name {
  description = "kubernetes cluster name"
  type        = string

  default     = "gondor-kubernetes-cluster"
}

variable cluster_version {
  description = "kubernetes version"
  type        = string

  default     = "1.24"
}

#- IAM IRSA
variable loadbalancer_controller_irsa_name {
  description = "description"
  type        = string

  default     = "gondor-irsa-loadbalancer-controller"
}