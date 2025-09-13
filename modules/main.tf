provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr_block    = "10.0.0.0/16"
  vpc_name          = "main-vpc"
  subnet_a_cidr     = "10.0.1.0/24"
  subnet_b_cidr     = "10.0.2.0/24"
  az_a               = "us-west-2a"
  az_b               = "us-west-2b"
}

module "iam" {
  source = "./modules/iam"
}

module "ecs" {
  source               = "./modules/ecs"
  task_definition_family = "my-ecs-task"
  execution_role_arn    = module.iam.ecs_task_role_arn
  task_role_arn         = module.iam.ecs_task_role_arn
  container_name        = "my-container"
  container_image       = "my-repo/my-image:latest"
  service_name          = "my-ecs-service"
  cluster_id            = module.ecs.ecs_cluster_name
  desired_count         = 2
  subnet_ids            = [module.vpc.subnet_a_id, module.vpc.subnet_b_id]
  security_group_ids    = ["sg-0123456789abcdef0"]  # Replace with your SG ID
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = "my-ecr-repo"
}

module "subnets" {
  source              = "./modules/subnets"
  vpc_id              = module.vpc.vpc_id
  subnet_cidr_blocks  = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                 = ["us-west-2a", "us-west-2b"]
  map_public_ip_on_launch = true
}
module "alb" {
  source = "./modules/alb"

  name             = "my-ecs-app"
  vpc_id           = var.vpc_id
  subnets          = var.public_subnets
  security_groups  = [aws_security_group.alb_sg.id]
  listener_port    = 80
  target_port      = 80
  target_type      = "ip"
  health_check_path = "/"

  tags = {
    Environment = "dev"
    Project     = "my-ecs-app"
  }
}