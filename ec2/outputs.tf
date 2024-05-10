# outputs.tf

output "instance_ids" {
  value = aws_instance.instance[*].id
}

output "instance_public_ips" {
  value = aws_instance.instance[*].public_ip
}

output "instance_private_ips" {
  value = aws_instance.instance[*].private_ip
}

output "instance_tags" {
  value = aws_instance.instance[*].tags.Name
}

output "instance_profile" {
  value = aws_instance.instance[*].iam_instance_profile
}
