
# Create security groups and associated rules
resource "aws_security_group" "security" {
  
  vpc_id = var.vpc_id


  name        = var.security_group_name
  description = var.security_group_description

  dynamic "ingress" {
    for_each = var.security_group_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Adjust as needed
    }
  }

 
  // Internal ingress rules
  ingress {
    from_port       = -1
    to_port         =  -1
    protocol        = "icmp"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }


  // Internal ingress rules
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = [var.vpc_cidr_block]
    prefix_list_ids = []
  }

  // Egress rules
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = [var.vpc_cidr_block]
    prefix_list_ids = []
  }

  // Egress rules
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

}