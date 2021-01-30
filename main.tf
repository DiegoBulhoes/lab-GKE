provider "google" {
  project = var.project
  region  = var.region
  version = "~> 3.35.0"
}
resource "google_compute_network" "vpc" {
  name                    = "${var.project}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.ip_cidr_range
}
resource "google_container_cluster" "primary" {
  name       = "gke-cluster-${var.project}"
  location   = var.location
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  node_locations = var.node_locations

  monitoring_service = "monitoring.googleapis.com/kubernetes"
  logging_service    = "logging.googleapis.com/kubernetes"

  remove_default_node_pool = var.remove_default_node_pool

  initial_node_count = var.initial_node_count

  master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = var.issue_client_certificate
    }
  }
}
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name               = "primary-preemptible-nodes-${var.project}"
  project            = var.project
  location           = var.location
  cluster            = google_container_cluster.primary.name
  initial_node_count = var.initial_node_count

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    preemptible  = false
    machine_type = var.machine_type
    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
    ]
  }
}
