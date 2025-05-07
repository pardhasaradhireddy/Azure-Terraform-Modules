resource "kubernetes_network_policy" "network_policy" {
  metadata {
    name      = var.policy_name
    namespace = var.namespace
  }

  spec {
    pod_selector {
      dynamic "match_expressions" {
        for_each = var.match_expressions
        content {
          key      = match_expressions.value.key
          operator = match_expressions.value.operator
          values   = match_expressions.value.values
        }
      }
    }

    # Dynamic ingress rules based on the input variable
    dynamic "ingress" {
      for_each = var.ingress
      content {
        dynamic "from" {
          for_each = ingress.value.from
          content {
            dynamic "ip_block" {
              for_each = try(from.value.ip_block != null ? [from.value.ip_block] : [], [])
              content {
                cidr   = ip_block.value.cidr
                except = ip_block.value.except
              }
            }

            dynamic "namespace_selector" {
              for_each = try(from.value.namespace_selector != null ? [from.value.namespace_selector] : [], [])
              content {
                match_labels = from.value["namespace_selector"]["match_labels"]
              }
            }

            dynamic "pod_selector" {
              for_each = try(from.value.pod_selector != null ? [from.value.pod_selector] : [], [])
              content {
                match_labels = from.value["pod_selector"]["match_labels"]
              }
            }
          }
        }

        dynamic "ports" {
          for_each = try(ingress.value["ports"], [])
          content {
            port     = ports.value["port"]
            protocol = ports.value["protocol"]
          }
        }
      }
    }

    policy_types = var.policy_types
  }
}