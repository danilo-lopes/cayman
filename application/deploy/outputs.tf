output "charts_metadata" {
  description = "status of the deployed releases"
  value       = tomap({
    for index, helm in helm_release.emojivoto:
        index => helm
  })
  sensitive = true
}
