output "s3_bucket_id" {
  description = "the name of the bucket"
  value       = try(module.s3.s3_bucket_id, "")
}