# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

data "aws_ami" "amazon-linux-2" {
  owners      = ["amazon"]
  most_recent = true

# https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html  ==>> filters
  filter {                                  
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "owner-alias"      
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }
}

# https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file
# https://registry.terraform.io/providers/hashicorp/template/latest/docs
data "template_file" "userdata" {
  template = file("${abspath(path.module)}/userdata.sh")
#   template = "${file("${path.module}/userdata.sh")}"
  vars = {
    server-name = var.server-name
  }
}


resource "aws_instance" "tfmyec2" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  count = var.num_of_instance
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id]
  user_data = data.template_file.userdata.rendered      # https://registry.terraform.io/providers/hashicorp/template/latest/docs 
# user_data = "${data.template_file.userdata.rendered}"
  tags = {
    Name = var.tag
  }
}


# https://www.bitslovers.com/terraform-dynamic/
# https://learning-ocean.com/tutorials/terraform/terraform-security-group
# https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks

resource "aws_security_group" "tf-sec-gr" {
  name = "${var.tag}-terraform-sec-grp"
  tags = {
    Name = var.tag
  }

  dynamic "ingress" {
    for_each = var.docker-instance-ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  egress {
    from_port =0
    protocol = "-1"
    to_port =0
    cidr_blocks = ["0.0.0.0/0"]
  }
}