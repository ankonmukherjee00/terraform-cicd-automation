output "task_definition_arn" {
  value = aws_ecs_task_definition.task_definition.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.ecs_service.name
}

output "ecs_service_id" {
  value = aws_ecs_service.ecs_service.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.this.name
}