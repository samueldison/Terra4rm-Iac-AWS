# allocate elastic ip. this eip will be used for the nat-gateway in public subnet az1a 
resource "aws_eip" "eip_for_nat_gateway_az1a" {

  tags = {
    Name = "eip-az1a"
  }
}
# create nat gateway & attache to public subnet az1a
resource "aws_nat_gateway" "nat_gateway-az1a" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1a.id
  subnet_id     = aws_subnet.public_subnet-az1a.id

  tags = {
    Name = "test_nat-az1a"
  }
}

# allocate elastic ip. this eip will be used for the nat-gateway in public subnet az1b
resource "aws_eip" "eip_for_nat_gateway_az1b" {

  tags = {
    Name = "eip-az1b"
  }
}
# create nat gateway & attache to public subnet az1b
resource "aws_nat_gateway" "nat_gateway-az1b" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1b.id
  subnet_id     = aws_subnet.public_subnet-az1b.id

  tags = {
    Name = "test_nat-az1b"
  }
}

