module "bucket" {
  source  = "./modules/simple_bucket"

  name       = "${var.project_id}-bucket"
  project_id = var.project_id
  location   = "us"

  website = {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors = [{
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }]

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age            = 365
      with_state     = "ANY"
      matches_prefix = var.project_id
    }
  }]

  custom_placement_config = {
    data_locations : ["US-EAST4", "US-WEST1"]
  }

  iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "group:test-gcp-ops@test.blueprints.joonix.net"
  }]

  autoclass = false
}