#------------------
# AKS Cert Manager
#------------------
resource "helm_release" "release" {
  name             = "cert-manager"
  chart            = "cert-manager"
  version          = var.chart_version
  create_namespace = false
  namespace        = "cert-manager"
  repository       = "https://charts.jetstack.io"
  replace          = false

  set {
    name  = "crds.enabled"
    value = "true"
  }

  set {
    name  = "tolerations[0].key"
    value = "app"
  }

  set {
    name  = "tolerations[0].operator"
    value = "Equal"
  }

  set {
    name  = "tolerations[0].value"
    value = "platform"
  }

  set {
    name  = "tolerations[0].effect"
    value = "NoSchedule"
  }

}