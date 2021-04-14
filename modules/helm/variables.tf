variable "kubernetes_dashboard_namespace" {
  default     = "kubernetes-dashboard"
  description = "kubernetes_dashboard_namespace"
}
variable "grafana_namespace" {
  default     = "grafana"
  description = "grafana_namespace"
}
variable "prometheus_namespace" {
  default     = "prometheus"
  description = "prometheus_namespace"
}
variable "grafana_admin_user" {
  default     = "admin"
  description = "admin"
}
variable "grafana_admin_password" {
  default     = "admin"
  description = "admin"
}
