output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_subnet_ids" {
  value = [for s in aws_subnet.private_subnets : s.id]
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public_subnets : s.id]
}

output "nat_gateway_eip" {
  value = aws_eip.nat_gateway_eip.public_ip
}
