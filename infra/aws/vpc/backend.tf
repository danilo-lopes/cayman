terraform {
  backend "s3" {
    bucket         = "<bucket>"
    key            = "vpc.tfstate"
    region         = "us-east-2"
    encrypt        = false
  }
}
