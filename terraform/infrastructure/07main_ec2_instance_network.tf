
resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.lb.id
}

# resource "aws_network_acl" "bar" {
#   vpc_id = aws_vpc.main.id

#   ingress = [
#     {
#       protocol   = "tcp"
#       rule_no    = 100
#       action     = "allow"
#       cidr_block = "0.0.0.0/0"
#       icmp_code  = 0
#       icmp_type  = 0
#       from_port  = 22
#       to_port    = 22
#       ipv6_cidr_block = "::/0"
#     }
#   ]
# }