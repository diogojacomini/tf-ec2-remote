# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name : "vpc-${var.environment}"
  }
}

# public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_subnet

  availability_zone = "${var.zone}a"

  tags = {
    Name = "subnet-public-${var.environment}"
  }
}

# private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_private_subnet

  availability_zone = "${var.zone}b"

  tags = {
    Name = "subnet-private-${var.environment}"
  }
}

# Internet getway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "internet-getway-${var.environment}"
  }
}

# Restrict inbound and outbound traffic and protect instances from unauthorized transit. 
# Using aws_network_acl and aws_security_group.
resource "aws_network_acl" "my_acl" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
}

resource "aws_security_group" "my_sg" {
  name_prefix = "security-group-${var.environment}"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.port_sg
    to_port     = var.port_sg
    protocol    = var.protocol_sg
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# virtual routing table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "route-table-${var.environment}"
  }
}

# route table association
# Allows network traffic to be forwarded correctly.
resource "aws_route_table_association" "my_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_rt.id
}
