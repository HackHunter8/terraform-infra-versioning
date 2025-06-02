# modules/vpc/.outputs.tf

output "vpc_id" {
  description = "the id of the vpc"
  value       = aws_vpc.this.id
}

output "igw_id" {
  description = "the id of the internet gateway"
  value       = aws_internet_gateway.this.id
}


output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
