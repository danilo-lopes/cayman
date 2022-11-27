terraform {
  backend "s3" {
    bucket         = "<bucket>"
    key            = "applications.tfstate"
    region         = "us-east-2"
    encrypt        = false
  }
}