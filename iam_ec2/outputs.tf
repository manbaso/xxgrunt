output "iam_instance_profile" {
  value = aws_iam_instance_profile.this.name
}

output "iam_role_name" {
  value = aws_iam_role.this.name
}

output "iam_policy_name" {
  value = aws_iam_policy.this.name
}

output "role_policy_attachment" {
  value = aws_iam_role_policy_attachment.this.policy_arn
}


