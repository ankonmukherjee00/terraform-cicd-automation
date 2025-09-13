# modules/subnets/main.tf
resource "aws_subnet" "subnet" {
  count             = length(var.subnet_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "subnet-${count.index}"
  }
}
