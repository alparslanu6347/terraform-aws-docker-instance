// https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables
variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "num_of_instance" {
  type = number
  default = 1
}

variable "tag" {
  type = string
  default = "Docker-Instance"
}

variable "server-name" {  // hostname olacak  makina içine girince göreceği
  type = string
  default = "docker-instance"
}

variable "docker-instance-ports" {  // https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables
  type = list(number)
  description = "docker-instance-sec-gr-inbound-rules"
  default = [22, 80, 8080]
}