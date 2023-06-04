// Output
output "public_dns" {
  value = aws_instance.ec2.public_dns
}

output "private_pem" {
  value     = tls_private_key.key.private_key_pem
  sensitive = true
}

output "public_web_app" {
  value = "${aws_instance.ec2.public_dns}:31234 2048-web app"
}

output "public_grafana" {
  value = "${aws_instance.ec2.public_dns}:30002 grafana"
}

output "public_prometheus" {
  value = "${aws_instance.ec2.public_dns}:30001 prometheus"
}
