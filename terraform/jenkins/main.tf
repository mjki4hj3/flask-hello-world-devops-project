provider "aws" {
    region="us-east-1"
}

variable "name" {
    default = "jenkins-server"
    type = string
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "jenkins-server"{
    ami = "ami-0c4f7023847b90238"

    instance_type = "t2.micro"
    key_name = "jenkins_server_key_pair"

    tags = {
        Name = "${var.name}"
    }

}