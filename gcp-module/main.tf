provider "google" {
  project = var.project_id
  region  = var.project_region
}

module "vm-buckt" {
  source = "./modules/vm-bucket-module"

  project_id = var.project_id
  project_region = var.project_region
  bucket_location = var.bucket_location
  vpc_name = var.vpc_name
  subnet_name = var.subnet_name
  ip_cidr = var.ip_cidr
  vm_name = var.vm_name
  machine_type = var.machine_type
  machine_image = var.machine_image
}