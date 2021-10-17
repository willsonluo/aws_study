variable "demo_name" {
  type = string
  default = "willson"
}

variable "ami" {
  type = string
  default = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "willson-demo-key"
}
