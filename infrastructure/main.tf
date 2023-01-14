data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source = "./modules/basic_networking"

  availability_zones = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2]
  ]
  has_igw         = true 
  namespace       = var.namespace
  private_subnets = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
  public_subnets  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  vpc_cidr_block  = "10.1.0.0/16"
}