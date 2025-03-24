#provider
variable "project_id" {
  description = "Gcp project id"
  type        = string
}

variable "project_region" {
  description = "Gcp project region"
  type        = string
}

#bucket
variable "bucket_location" {
  description = "Bucket location"
  type        = string
}

#vpc
variable "vpc_name" {
  description = "Vpc name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}
variable "ip_cidr" {
  description = "ip block"
  type        = string
}

#vm
variable "vm_name" {
  description = "Vm name"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
}

variable "machine_image" {
  description = "Machine image"
  type        = string
}