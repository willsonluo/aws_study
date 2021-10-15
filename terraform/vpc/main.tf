provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "${var.demo_name}-vpc"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.demo_name}-sub1"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.20.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.demo_name}-sub2"
  }
}

resource "aws_subnet" "sub3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.30.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.demo_name}-sub3"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.demo_name}-igw"
  }
}

resource "aws_route" "public" {
  route_table_id = aws_vpc.main.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  egress = [
    {
      protocol   = "tcp"
      rule_no    = 200
      action     = "allow"
      cidr_block = "192.168.0.0/16"
      from_port  = 443
      to_port    = 443
    }
  ]

  ingress = [
    {
      protocol   = "tcp"
      rule_no    = 100
      action     = "allow"
      cidr_block = "192.168.0.0/16"
      from_port  = 80
      to_port    = 80
    }
  ]

  tags = {
    Name = "main"
  }
}