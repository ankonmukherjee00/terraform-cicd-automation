variable "name" {
  description = "Name prefix for ALB and resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB and Target Group"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups for the ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "Listener port for the ALB"
  type        = number
  default     = 80
}

variable "target_port" {
  description = "Port ECS container is listening on"
  type        = number
  default     = 80
}

variable "target_type" {
  description = "Target type for target group (instance or ip)"
  type        = string
  default     = "ip"
}

variable "health_check_path" {
  description = "Path for target group health check"
  type        = string
  default     = "/"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
