variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Amazon Linux 2023"
}

variable "key_name" {
  description = "The name of the SSH key pair. This is a required input, and there is no default value."
  type        = string
}

variable "num_of_instance" {
  description = "Number of instances"
  type        = number
  default     = 1
}

variable "tag" {
  description = "Tag of the AWS Linux 2023 EC2"
  type        = string
  default     = "Docker-Instance"
}

variable "server-name" {
  description = "Hostname of the server"
  type        = string
  default     = "docker-instance"
}

variable "docker-instance-ports" {
  description = "docker-instance-sec-gr-inbound-rules"
  type        = list(number)
  default     = [22, 80, 8080]
}