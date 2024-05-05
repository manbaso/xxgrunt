variable "cidr_blocks_public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"] # Add more CIDR blocks as needed
}

variable "availability_zones_public_subnets" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"] # Add more availability zones as needed
}

variable "cidr_blocks_private_subnets" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"] # Add more CIDR blocks as needed
}

variable "availability_zones_private_subnets" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"] # Add more availability zones as needed
}

variable "aws_region" {
  type    = string
  default = "us-east-1"# Add more availability zones as needed
}

variable "cidr_block_vpc" {
  type    = string
  default = "10.0.0.0/16" # Add more availability zones as needed
}
