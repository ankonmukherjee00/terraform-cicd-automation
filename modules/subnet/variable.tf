variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for the subnets"
  type        = bool
}
