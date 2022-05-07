# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "jenkins_server"{
    ami = "ami-0c4f7023847b90238"
    instance_type = "t2.micro"
    key_name = "jenkins_server_key_pair"
    tags = {
        Name = "${var.name}"
    }
}

resource "aws_network_interface_sg_attachment" "sg_attatchement" {
    security_group_id = aws_security_group.ingress_jenkins.id
    network_interface_id = aws_instance.jenkins_server.primary_network_interface_id
  
}