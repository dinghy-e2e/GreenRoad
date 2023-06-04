// Output
output "public_dns" {
  value = aws_instance.ec2.public_dns
}

output "private_pem" {
  value     = tls_private_key.key.private_key_pem
  sensitive = true
}