# Required variables
variable "environment_name" {
  description = "Environment Name"
}

# Optional variables
variable "vpc_cidr" {
  default = "172.19.0.0/16"
}

variable "vpc_cidrs_public" {
  default = [
    "172.19.0.0/20",
  ]
}


# Outputs
output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "subnet_public_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "security_group_apps" {
  value = "${aws_security_group.egress_public.id}"
}

