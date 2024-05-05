# variables.tf

variable "instance_count" {
  type    = number
  default = 1  # You can change the default value according to your requirement
}

variable "ami" {
  type    = string
#   default = "ami-12345678"  # Replace with your desired AMI ID
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small"]  # Add more instance types as needed
}

# variable "private_ip" {
#   type    = list(string)
#   default = ["10.0.0.10", "10.0.0.11"]  # Example private IP addresses, replace with your own
# }

variable "key_name" {
  type    = string
  default = "my-key-pair"  # Replace with your key pair name
}

variable "instance_tag" {
  type    = string
  default = "monitoring-instance"  # Replace with your desired instance tag
}

variable "subnet_id" {
  type    = string
  
}
