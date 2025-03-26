provider "google" {
  project = var.project_id
  region  = var.project_region
}

module "vm-bucket" {

  for_each = { for k, v in var.parameters : k => v }

  source = "./modules/vm-bucket-module"

  project_id      = var.project_id
  project_region  = var.project_region
  bucket_location = each.value.bucket_location
  vpc_name        = each.value.vpc_name
  subnet_name     = each.value.subnet_name
  ip_cidr         = each.value.ip_cidr
  vm_name         = each.value.vm_name
  machine_type    = each.value.machine_type
  machine_image   = each.value.machine_image
}