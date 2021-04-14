resource "kubernetes_namespace" "kubernetes-dashboard" {
  metadata {
    name = var.kubernetes_dashboard_namespace
  }
}

resource "helm_release" "kubernetes-dashboard" {
  name       = "kubernetes-dashboard"
  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"
  namespace  = kubernetes_namespace.kubernetes-dashboard.metadata.0.name
}

resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = var.prometheus_namespace
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kube-prometheus"
  namespace  = kubernetes_namespace.prometheus.metadata.0.name
}

resource "kubernetes_namespace" "grafana" {
  metadata {
    name = var.grafana_namespace
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = kubernetes_namespace.grafana.metadata.0.name
  set {
    name  = "adminUser"
    value = var.grafana_admin_user
  }
  set {
    name  = "adminPassword"
    value = var.grafana_admin_password
  }
}