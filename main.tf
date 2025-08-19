provider "aws" {
  region = var.region
}

module "ec2" {
  source   = "./modules/ec2"
  ssh_cidr = var.ssh_cidr
}
