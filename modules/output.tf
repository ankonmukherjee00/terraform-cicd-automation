output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "ecr_url" {
  value = module.ecr.ecr_repository_url
}
