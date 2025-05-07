#--------------------
# AKS GitHub Runners
#--------------------
resource "helm_release" "release" {
  name             = "github-runners"
  chart            = "actions-runner-controller"
  version          = var.chart_version
  create_namespace = false
  namespace        = "github-runners"
  repository       = "https://actions-runner-controller.github.io/actions-runner-controller/"
  replace          = false

  set {
    name  = "authSecret.create"
    value = "true"
  }

  set {
    name  = "authSecret.github_token"
    value = var.GITHUB-RUNNERS-PAT
  }

  set {
    name  = "githubEnterpriseServerURL"
    value = "https://git.t3.daimlertruck.com"
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

  set {
    name  = "image.actionsRunnerRepositoryAndTag"
    value = "acrhubcus01.azurecr.io/platform/selfhosted-privaterunner:${var.github_runners_image_version}"
  }

}