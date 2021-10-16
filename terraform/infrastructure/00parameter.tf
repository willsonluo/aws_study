provider "aws" {
    region = "us-east-1"
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "vpc_igw" {
  value = aws_internet_gateway.gw.id
}

