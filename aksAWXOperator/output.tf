output "release_status" {
  description = "Status of the deployed AWX Helm release"
  value       = helm_release.this.status
}

output "release_info" {
  description = "Information about the deployed AWX Helm release"
  value       = helm_release.this
}
