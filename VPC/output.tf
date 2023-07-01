# VPC outputs

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "subnet-1-cidr_block" {
  value = aws_subnet.public_subnet-az1a.cidr_block
}

output "subnet-2-cidr_block" {
  value = aws_subnet.public_subnet-az1b.cidr_block
}

output "subnet-3-cidr_block" {
  value = aws_subnet.private_app_subnet-az1a.cidr_block
}

output "subnet-4-cidr_block" {
  value = aws_subnet.private_app_subnet-az1b.cidr_block
}

output "subnet-5-cidr_block" {
  value = aws_subnet.private_db_subnet-az1a.cidr_block
}

output "subnet-6-cidr_block" {
  value = aws_subnet.private_db_subnet-az1b.cidr_block
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.test_igw.id
}

output "route_table-1" {
  value = aws_route_table.public_rt.id
}

output "route_table-2" {
  value = aws_route_table.private_rt-1.id
}

output "route_table-3" {
  value = aws_route_table.private_rt-2.id
}

output "public_subnet-1" {
  value = aws_subnet.public_subnet-az1a.id
}

output "public_subnet-2" {
  value = aws_subnet.public_subnet-az1b.id
}

output "private_subnet-1" {
  value = aws_subnet.private_app_subnet-az1a.id
}

output "private_subnet-2" {
  value = aws_subnet.private_app_subnet-az1b.id
}

output "private_subnet-3" {
  value = aws_subnet.private_db_subnet-az1a.id
}

output "private_subnet-4" {
  value = aws_subnet.private_db_subnet-az1b.id
}

output "eip-1" {
  value = aws_eip.eip_for_nat_gateway_az1a.id
}

output "eip-2" {
  value = aws_eip.eip_for_nat_gateway_az1b.id
}

output "nat_gateway-1" {
  value = aws_nat_gateway.nat_gateway-az1a.id
}

output "nat_gateway-2" {
  value = aws_nat_gateway.nat_gateway-az1b.id
}
