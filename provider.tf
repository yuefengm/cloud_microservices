provider "google" {
    project = var.project_id
    region = var.region
    zone = var.zone
    credentials = var.credentials_json
}

data "google_client_config" "default" {}

