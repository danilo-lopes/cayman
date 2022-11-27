terraform {
  required_providers {
    aws = {
      version = "4.40.0"
    }
  }
}

provider "aws" {
  region = var.region
}