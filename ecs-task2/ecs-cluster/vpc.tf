resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    owner     = "Shokhrukh"
    component = "Terraform VPC"
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.main.id

  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, 1) # means shift to next 8 bits in mask and add 1 to the octet: 10.0.0.0/16 -> 10.0.1.0/24
  # or we could just write: cidr_block = "10.0.1.0/24"

  map_public_ip_on_launch = true

  # adding availability zone is a good practice, but not required
  availability_zone = var.availability_zones
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    owner     = "Shokhrukh"
    component = "Terraform VPC IGW"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet_route" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.rt.id
}