resource "random_id" "id" {
	  byte_length = 8
}

module "s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.bucket_name}-${random_id.id.hex}"
  acl    = "private"

  # just for POC environment !
  force_destroy = true

  versioning = {
    enabled = false
  }

  tags = merge(
    var.tags,
    {
      Name = var.bucket_name
    }
  )
}