module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  network_name = var.network_name
}

module "subnet" {
  source       = "./modules/subnets"
  project_id   = var.project_id
  network_name = module.vpc.network_name
  subnets      = var.subnets
}

module "vm" {
  source            = "./modules/compute_instance"
  instance_template = var.instance_template
}

module "bucket" {
  source     = "./modules/simple_bucket"
  project_id = var.project_id
  location   = var.bucket_location
  name       = var.bucket_name
}
