# modules/vpc.outputs.tf

output "vpc_id" {
  description = "the id of the vpc"
  value       = aws_vpc.main.id
}

output "igw_id" {
  description = "the id of the internet gateway"
  value       = aws_internet_gateway.igw.id
}
