output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "ecr_url" {
  value = module.ecr.ecr_repository_url
}
