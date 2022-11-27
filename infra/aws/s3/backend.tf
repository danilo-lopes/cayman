terraform {
  backend "s3" {
    bucket         = "<bucket>"
    key            = "s3.tfstate"
    region         = "us-east-2"
    encrypt        = false
  }
}
