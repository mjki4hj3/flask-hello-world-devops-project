variable "name" {
    default = "jenkins-server"
    type = string
}


variable "ingress_ports" {
  type = list(number)
  description = "values for ingress ports"
  default = [80, 443]
}

variable "local_ip" {
  description = "local ip address"
}