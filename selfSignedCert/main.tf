resource "tls_self_signed_cert" "this" {
  private_key_pem = tls_private_key.this.private_key_pem
  subject {
    common_name = var.domain_name
  }
  validity_period_hours = 1460 * 24 # 1460 days
  allowed_uses          = ["key_encipherment", "digital_signature", "server_auth", "any_extended", "cert_signing", "client_auth", "code_signing", "content_commitment", "crl_signing", "data_encipherment", "decipher_only", "digital_signature", "email_protection", "encipher_only", "ipsec_end_system", "ipsec_tunnel", "ipsec_user", "key_agreement", "key_encipherment", "microsoft_commercial_code_signing", "microsoft_kernel_code_signing", "microsoft_server_gated_crypto", "netscape_server_gated_crypto", "ocsp_signing", "server_auth", "timestamping"]
}

# RSA key of size 4096 bits
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_locally_signed_cert" "this" {
  cert_request_pem   = tls_cert_request.this.cert_request_pem
  ca_private_key_pem = tls_private_key.this.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.this.cert_pem

  validity_period_hours = 1460 * 24 # 1460 days

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "tls_cert_request" "this" {
  private_key_pem = tls_private_key.this.private_key_pem

  subject {
    common_name  = var.domain_name
    organization = "Daimler Truck, Inc"
  }
}