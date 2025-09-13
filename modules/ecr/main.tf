# modules/ecr/main.tf
resource "aws_ecr_repository" "ecr_repo" {
  name = var.repository_name
}
