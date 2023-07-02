#      VPC - US-EAST-1: 10.0.0.0/16 
# us-east-1a: public  = 10.0.1.0/24 (bastion)
# us-east-1b: private = 10.0.2.0/24 (mysql)
# us-east-1c: private = 10.0.3.0/24 (mysql)

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    owner     = "Shokhrukh"
    component = "RDS VPC .tf"
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.main.id

  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, 1) # means shift to next 8 bits in mask and add 1 to the octet: 10.0.0.0/16 -> 10.0.1.0/24

  map_public_ip_on_launch = true

  availability_zone = var.availability_zones[0]
}

resource "aws_subnet" "prv_subnet_az1" {
  vpc_id = aws_vpc.main.id

  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, 2) # "10.0.2.0/24"

  availability_zone = var.availability_zones[1]
}

resource "aws_subnet" "prv_subnet_az2" {
  vpc_id = aws_vpc.main.id

  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, 3) # "10.0.3.0/24"

  availability_zone = var.availability_zones[2]
}


resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my_db_subnet_group"
  subnet_ids = [aws_subnet.prv_subnet_az1.id, aws_subnet.prv_subnet_az2.id]
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.public_rt.id
}