terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0"
    }
  }
}

resource "kubectl_manifest" "prometheus_rule" {
  override_namespace = var.namespace
  yaml_body          = <<YAML
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: "${var.name}"
  namespace: "${var.namespace}"
  labels:
    app: kube-prometheus-stack
    release: prometheus
spec:
  groups:
    - name: "${var.name}"
      rules:
        - alert: "${var.name}"
          expr: "${var.expr}"
          for: "${var.for}"
          labels:
            severity: "${var.severity}"     
          annotations:
            summary: "${var.summary}"
            runbook: "${var.runbook}"
            description: "${var.description}"
 YAML
}