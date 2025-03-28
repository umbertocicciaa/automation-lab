provider "google" {
  project = var.project_id
  region  = var.project_region
}

resource "random_id" "default" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name     = "${random_id.default.hex}-bucket"
  location = var.bucket_location

  force_destroy               = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "google_compute_network" "compute_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "compute_subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.ip_cidr
  region                   = var.project_region
  network                  = google_compute_network.compute_vpc.id
  private_ip_google_access = true
}

resource "google_compute_instance" "instance" {
  name                      = var.vm_name
  zone                      = "${var.project_region}-a"
  machine_type              = var.machine_type
  allow_stopping_for_update = true

  network_interface {
    subnetwork = google_compute_subnetwork.compute_subnet.name
    access_config {}
  }

  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }

}

resource "google_compute_firewall" "ssh-rule" {
  name = var.firewall_rule
  network = google_compute_network.compute_vpc.name
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
