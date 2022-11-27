locals {
    private_subnet_tags = {
      "kubernetes.io/role/internal-elb" = "1"
    }
    public_subnet_tags = {
      "kubernetes.io/role/elb" = "1"
    }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = [
    "${var.region}a",
    "${var.region}b",
    "${var.region}c"
  ]
  private_subnets = var.vpc_private_subnets_cidr
  public_subnets  = var.vpc_public_subnets_cidr

  enable_ipv6 = false
  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  public_subnet_tags = local.public_subnet_tags
  private_subnet_tags = local.private_subnet_tags

  tags = merge(
    var.tags,
  )
  
  vpc_tags = {
    Name = var.vpc_name
  }
}