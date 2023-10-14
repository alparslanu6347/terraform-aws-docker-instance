# Terraform Module to provision an AWS EC2 instance with the latest amazon linux 2 ami and installed docker in it.
- userdata includes docker install
- Not intended for production use. It is an example module.

- It is just for showing how to create a publish module in Terraform Registry.

Usage:

```hcl

provider "aws" {
  region = "us-east-1"
}

module "docker_instance" {
    source = "alparslanu6347/docker-instance/aws"
    key_name = "arrow"
}
```