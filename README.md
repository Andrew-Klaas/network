# network-aws-simple

Creates a standard VPC with:
- One public subnet
- One NAT Gateway in each public subnet

## Requirements

This module requires a pre-existing AWS key pair to install on each bastion host.

### Environment Variables

- `AWS_DEFAULT_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

### Terraform Variables

You can pass the following Terraform variables during `terraform apply` or
in a `terraform.tfvars` file. Examples below:

- `environment_name` = "network-test"
- `ssh_key_name` = "test_aws"

## Outputs

- `vpc_id`
- `subnet_public_ids`
- `security_group_apps`

## Usage

```
variable "environment_name" {
  default = "network-test"
  description = "Environment Name"
}

variable "ssh_key_name" {
  default = "test_aws"
  description = "Pre-existing AWS key name you will use to access the instance(s)"
}

module "network-aws-simple" {
  source           = "git@github.com:hashicorp-modules/network-aws-simple.git"
  environment_name = "${var.environment_name}"
  ssh_key_name     = "${module.ssh-keypair-aws.ssh_key_name}"
}
```
