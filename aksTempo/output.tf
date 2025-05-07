output "lokirelease_status" {
  description = "Status of the deployed KEDA Helm release"
  value       = helm_release.this.status
}

output "loki_release_info" {
  description = "Information about the deployed KEDA Helm release"
  value       = helm_release.this
}
