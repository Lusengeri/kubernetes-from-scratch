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

  has_igw          = true
  namespace        = var.namespace
  database_subnets = ["10.1.201.0/24", "10.1.202.0/24", "10.1.203.0/24"]
  private_subnets  = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
  public_subnets   = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  vpc_cidr_block   = "10.1.0.0/16"
}

resource "aws_instance" "controller_" {
  count                       = length(data.aws_availability_zones.available.names)
  ami                         = "ami-0b77c7ff102378378"
  associate_public_ip_address = false
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  instance_type               = "t2.medium"
  key_name                    = var.key_name
  user_data                   = ""
  user_data_replace_on_change = true
  vpc_security_group_ids      = [module.network.sgs.cluster_sg]
}