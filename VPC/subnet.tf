# create public subnet az1
resource "aws_subnet" "public_subnet-az1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [0]
  availability_zone       = "${var.aws_zones}" [0]
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-az1a"
  }
}

# create public subnet az2
resource "aws_subnet" "public_subnet-az1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [1]
  availability_zone       = "${var.aws_zones}" [1]
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-az1b"
  }
}

# create private app subnet az1
resource "aws_subnet" "private_app_subnet-az1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [2]
  availability_zone       = "${var.aws_zones}" [0]
  map_public_ip_on_launch = false

  tags = {
    Name = "AppSubnet-az1a"
  }
}

# create private app subnet az2
resource "aws_subnet" "private_app_subnet-az1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [3]
  availability_zone       = "${var.aws_zones}" [1]
  map_public_ip_on_launch = false

  tags = {
    Name = "AppSubnet-az1b"
  }
}

# create private db subnet az1
resource "aws_subnet" "private_db_subnet-az1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [4]
  availability_zone       = "${var.aws_zones}" [0]
  map_public_ip_on_launch = false

  tags = {
    Name = "DBSubnet-az1a"
  }
}

# create private db subnet az2
resource "aws_subnet" "private_db_subnet-az1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [5]
  availability_zone       = "${var.aws_zones}" [1]
  map_public_ip_on_launch = false

  tags = {
    Name = "DBSubnet-az1b"
  }
}
