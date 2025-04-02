# network
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


# vm
module "instance_template" {
  source                 = "./modules/instance_template"
  region                 = var.project_region
  project_id             = var.project_id
  create_service_account = false
  service_account        = { email = module.service_account.email }
  network = module.vpc.network_name
}

module "vm" {
  source            = "./modules/compute_instance"
  instance_template = module.instance_template.name
}

module "service_account" {
  source     = "./modules/simple-sa"
  project_id = var.project_id
  name       = var.service_account_name
  project_roles = var.service_account_roles
}

# bucket
module "bucket" {
  source     = "./modules/simple_bucket"
  project_id = var.project_id
  location   = var.bucket_location
  name       = var.bucket_name
}
