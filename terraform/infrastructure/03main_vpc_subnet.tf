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
