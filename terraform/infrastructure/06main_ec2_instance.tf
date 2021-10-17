resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.sub1.id
  private_ips = ["192.168.10.8"]
  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  root_block_device {
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp2"
  }

  lifecycle {
     ignore_changes = [ami]
     }

  tags = {
    Name = "EC2 demo"
  }
}
