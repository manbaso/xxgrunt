

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.cidr_block_vpc
  enable_dns_hostnames = true
}

# Create public subnets
resource "aws_subnet" "public_subnet" {
  count                   = length(var.cidr_blocks_public_subnets)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_blocks_public_subnets[count.index]
  availability_zone       = var.availability_zones_public_subnets[count.index]
  map_public_ip_on_launch = true
}

# Create private subnets
resource "aws_subnet" "private_subnet" {
  count            = length(var.cidr_blocks_private_subnets)
  vpc_id           = aws_vpc.my_vpc.id
  cidr_block       = var.cidr_blocks_private_subnets[count.index]
  availability_zone = var.availability_zones_private_subnets[count.index]
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# # Attach Internet Gateway to VPC
# resource "aws_vpc_attachment" "my_vpc_attachment" {
#   vpc_id             = aws_vpc.my_vpc.id
#   internet_gateway_id = aws_internet_gateway.my_igw.id
# }

# Create Route Table for Public Subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Create NAT Gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id # Using the first public subnet for NAT Gateway
}

# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "my_eip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.igw]
}

# Create Route Table for Private Subnets
resource "aws_route_table" "private_route_table" {
  count  = length(aws_subnet.private_subnet)
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}
