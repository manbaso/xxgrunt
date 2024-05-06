resource "aws_instance" "instance" {
  count         = var.instance_count  # Creating instances for each security group
  ami           = var.ami  # Your desired AMI ID
  instance_type = var.instance_types[count.index % length(var.instance_types)]
  
  subnet_id     = var.subnet_id

  # subnet_id =  var.private_subnet == private ? aws_subnet.private.id : aws_subnet.public.id 

  # private_ip = var.private_ip[count.index % length(var.private_ip)]
  # private_ip = var.private_ip[count.index ]

  associate_public_ip_address = true

  key_name        = var.key_name
  
  
  
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    
    Name = "${var.instance_tag}-${count.index + 1}" 
  }
}
