terraform {
  backend "s3" {
    bucket         = "<bucket>"
    key            = "eks.tfstate"
    region         = "us-east-2"
    encrypt        = false
  }
}
