resource "helm_release" "this" {
  name       = var.release_name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "tempo"
  version    = var.helm_version
  namespace  = var.namespace

  values = [
    file("${path.module}/custom_values.yaml")
  ]

  set {
    name  = "tempo.compactor.compaction.block_retention"
    value = var.retention
  }

  set {
    name  = "tempo.storage.trace.azure.storage_account_name"
    value = var.backend.storage_account_name
  }

  set {
    name  = "tempo.storage.trace.azure.user_assigned_id"
    value = var.backend.user_assigned_id
  }
}