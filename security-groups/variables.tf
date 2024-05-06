variable "security_group_name" {
  description = "Name of the security group"
}

variable "security_group_description" {
  description = "Description of the security group"
}

variable "security_group_ports" {
  description = "List of ports to open in the security group"
  type        = list(number)
}

variable "vpc_cidr_block" {
  description = "CIDR block of the VPC"
}

variable "vpc_id" {
  description = "vpc id for the security group"
  type   = string
}