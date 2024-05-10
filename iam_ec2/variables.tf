variable "instance_profile" {
  description = "Name of the IAM instance profile"
  type        = string
}

variable "iam_role" {
  description = "Name of the IAM role"
  type        = string
}

variable "iam_policy" {
  description = "Name of the IAM policy"
  type        = string
}

variable "iam_policy_description" {
  description = "Description of the IAM policy"
  type        = string
}

variable "iam_assume_role_policy_json_doc" {
  description = "JSON document for IAM assume role policy"
  type        = string
}

variable "iam_policy_json_doc" {
  description = "JSON document for IAM policy"
  type        = string
}
