resource "helm_release" "emojivoto" {
  for_each   = {
    for index, app in var.applications_helm:
      app.name => app
  }

  name       = each.value.name
  # charts are local.. then the repository is local path
  repository = "${path.module}/../helm-stack/"
  chart      = each.value.chartName
  version    = each.value.version
  namespace  = each.value.namespace

  values     = [
    file("${path.module}/../helm-stack/${each.value.chartName}/values.yaml")
  ]
}