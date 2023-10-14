// https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables
variable "instance_type" {
  type = string
  default = "t2.micro"    // you can change -->> t3a.medium
}

variable "key_name" {
  type = string
  default = "arrow"   // write your key_name
}

variable "num_of_instance" {
  type = number
  default = 1
}

variable "tag" {
  type = string
  default = "Docker-Instance"
}

variable "server-name" {  // your hostname, you'll see when you connect via ssh
  type = string
  default = "docker-instance"
}

variable "docker-instance-ports" {  // https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables
  type = list(number)
  description = "docker-instance-sec-gr-inbound-rules"
  default = [22, 80, 8080]
}