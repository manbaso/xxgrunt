# outputs.tf

output "instance_ids" {
  value = aws_instance.monitoring[*].id
}

output "instance_public_ips" {
  value = aws_instance.monitoring[*].public_ip
}

output "instance_private_ips" {
  value = aws_instance.monitoring[*].private_ip
}

output "instance_tags" {
  value = aws_instance.monitoring[*].tags.Name
}
