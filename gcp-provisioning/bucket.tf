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
