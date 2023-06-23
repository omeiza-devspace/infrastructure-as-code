output "region" {
  value = var.region
}

output "vpc_name" {
  value = var.vpc_name
}

output "vpc_id" {
  value = aws_vpc.project_vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

output "public_gateway_subnet_az1_id" {
  value = aws_subnet.public_gateway_subnet_az1.id
}

output "public_gateway_subnet_az2_id" {
  value = aws_subnet.public_gateway_subnet_az2.id
}

output "private_proxy_subnet_az1_id" {
  value = aws_subnet.private_proxy_subnet_az1.id
}

output "private_proxy_subnet_az2_id" {
  value = aws_subnet.private_proxy_subnet_az2.id
}

output "private_compute_subnet_az1_id" {
  value = aws_subnet.private_compute_subnet_az1.id
}

output "private_compute_subnet_az2_id" {
  value = aws_subnet.private_compute_subnet_az2.id
}
