output "cert_pem" {
  value = tls_locally_signed_cert.this.cert_pem
}

output "private_key_pem" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}