# You can define common variables like region, etc.
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}


variable "public_subnets" {
  type = list(string)
}