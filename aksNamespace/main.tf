#----------------------
# Kubernetes Namespace
#----------------------
resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = {
      name = try(var.annotations, null)
    }

    labels = {
      mylabel = try(var.labels, null)
    }

    name = try(var.name, null)
  }
}