# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "ingress_jenkins" {
  name        = "ingress_jenkins"
  description = "Ingress for Jenkins"

  dynamic ingress {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
      description = "SSH from Local"
      from_port   = 22
      to_port     = 22
      protocol  = "tcp" 
      cidr_blocks = ["${var.local_ip}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
