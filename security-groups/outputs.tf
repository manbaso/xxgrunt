output "vpc_security_group_ids" {
  description = "The ID of the created security group"
  value       = aws_security_group.security.id
}
