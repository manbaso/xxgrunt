resource "aws_iam_instance_profile" "this" {
  name = var.instance_profile
  role = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name               = var.iam_role
#   assume_role_policy = jsonencode(var.iam_assume_role_policy_json_doc)
  assume_role_policy = (var.iam_assume_role_policy_json_doc)
}

resource "aws_iam_policy" "this" {
  name        = var.iam_policy
  description = var.iam_policy_description
  
#   policy = jsonencode(var.iam_policy_json_doc)
  policy = (var.iam_policy_json_doc)
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}