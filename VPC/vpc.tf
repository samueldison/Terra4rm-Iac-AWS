# create vpc block
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.vpc_tag}"
  }
}

# create internet gateway and attach to custom vpc
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.igw_tag}"
  }
}

# create route table for internet access
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "${var.rt_tag-1}"
  }
}

# associate public subnet az1 with public route table
resource "aws_route_table_association" "public_route_1" {
  subnet_id      = aws_subnet.public_subnet-az1a.id
  route_table_id = aws_route_table.public_rt.id
}

# associate public subnet az2 to public route table
resource "aws_route_table_association" "public_route_2" {
  subnet_id      = aws_subnet.public_subnet-az1b.id
  route_table_id = aws_route_table.public_rt.id
}

# create private route table 1
resource "aws_route_table" "private_rt-1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway-az1a.id
  }

  tags = {
    Name = "${var.rt_tag-1}"
  }
}
# create private route table 2
resource "aws_route_table" "private_rt-2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway-az1b.id
  }

  tags = {
    Name = "${var.rt_tag-2}"
  }
}

# associate private App subnet az1a & DB subnet az1a  to private route table 1
resource "aws_route_table_association" "private_app_subnet-az1a-route" {
  subnet_id      = aws_subnet.private_app_subnet-az1a.id
  route_table_id = aws_route_table.private_rt-1.id
}

resource "aws_route_table_association" "private_db_subnet-az1a-route" {
  subnet_id      = aws_subnet.private_db_subnet-az1a.id
  route_table_id = aws_route_table.private_rt-1.id
}

# associate private App subnet az1b & DB subnet az1b  to private route table 2
resource "aws_route_table_association" "private_app_subnet-az1b-route" {
  subnet_id      = aws_subnet.private_app_subnet-az1b.id
  route_table_id = aws_route_table.private_rt-2.id
}

resource "aws_route_table_association" "private_db_subnet-az1b-route" {
  subnet_id      = aws_subnet.private_db_subnet-az1b.id
  route_table_id = aws_route_table.private_rt-2.id
}
