variable "project" {
  description = "project id"
}

variable "region" {
  default     = "us-central1"
  description = "region"
}

variable location {
  description = "location"
  default     = "us-central1-a"
}

variable node_locations {
  description = "node_locations"
  default = [
    "us-central1-b",
    "us-central1-c",
  ]
}

variable "gke_username" {
  default     = "ks8"
  description = "gke username"
}

variable "gke_password" {
  default     = "password"
  description = "gke password"
}

variable "ip_cidr_range" {
  default     = "10.10.0.0/24"
  description = "ip cidr range"
}

variable "machine_type" {
  default     = "n1-standard-1"
  description = "machine type"
}

variable "initial_node_count" {
  default     = "1"
  description = "initial node count"
}

variable "remove_default_node_pool" {
  default     = "true"
  description = "remove default node pool"
}

variable "issue_client_certificate" {
  default     = "false"
  description = "issue client certificate"
}

variable "gke_num_nodes" {
  default     = 1
  description = "gke num nodes"
}

variable "min_node_count" {
  default     = 1
  description = "min_node_count"
}

variable "max_node_count" {
  default     = 2
  description = "max_node_count"
}

variable "auto_upgrade" {
  default     = false
  description = "auto_upgrade"
}

variable "auto_repair" {
  default     = true
  description = "auto_repair"
}
