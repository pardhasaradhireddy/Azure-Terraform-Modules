#--------------
# Helm Release
#--------------
resource "helm_release" "release" {
  name             = var.name
  chart            = var.chart
  version          = try(var.chart_version, null)
  create_namespace = try(var.create_namespace, false)
  namespace        = try(var.namespace, "default")
  repository       = try(var.repository, null)
  replace          = try(var.replace, false)

  dynamic "set" {
    for_each = var.set
    content {
      name  = set.key
      value = set.value
    }
  }
}