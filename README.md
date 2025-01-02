# Terraform Module to provision an AWS EC2 instance with the latest Amazon linux 2023 ami and installed docker in it.

- userdata includes docker & docker-compose (v2.28.1) install

- Not intended for production use. It is an example module.

- It is just for showing how to create a publish module in Terraform Registry.

Usage:

```hcl

provider "aws" {
  region = "us-east-1"
}

module "docker-instance" {
    source = "alparslanu6347/docker-instance/aws"
    key_name = "mykey"
}
```