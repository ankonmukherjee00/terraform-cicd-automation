variable "task_definition_family" {
  description = "The family of the ECS task definition"
  type        = string
}

variable "execution_role_arn" {
  description = "The IAM role ARN that allows ECS to pull the container image from ECR"
  type        = string
}

variable "task_role_arn" {
  description = "The IAM role ARN that allows ECS tasks to perform actions"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "The Docker image to use for the container"
  type        = string
}

variable "cpu" {
  description = "The CPU unit to allocate for the ECS task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "The memory to allocate for the ECS task"
  type        = string
  default     = "512"
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "ECS Cluster ID"
  type        = string
}

variable "desired_count" {
  description = "The desired number of tasks to run in the service"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the ECS service"
  type        = list(string)
}
