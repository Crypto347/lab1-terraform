output "private_key" {
  value     = tls_private_key.tls.private_key_pem
  sensitive = true
}

output "key_name" {
  value = aws_key_pair.generated_key.key_name
}