provider "kubernetes" {
}

resource "kubernetes_namespace" "django-cms" {
    metadata {
       name = "django-cms"
    }
}

resource "kubernetes_storage_class" "lazy-local-storage" {
    metadata {
        name = "lazy-local-storage" # NB: must match regex
#        namespace = kubernetes_namespace.django-cms.metadata[0].name
    }

    storage_provisioner = "topolvm.cybozu.com"
    reclaim_policy = "Retain"

    volume_binding_mode = "WaitForFirstConsumer" # to ensure volume is co-located with psql container
}

resource "kubernetes_persistent_volume_claim" "django-cms-psql-pvc" {
    metadata {
       name = "django-cms-psql-pvc"
       namespace = kubernetes_namespace.django-cms.metadata[0].name
    }

    spec {
       access_modes = [ "ReadWriteOnce" ]
       resources {
          requests = {
             storage = "9Gi"
          }
       }
       storage_class_name = kubernetes_storage_class.lazy-local-storage.metadata.0.name
    }

    wait_until_bound = false # NB: node topology scheduling may take time... so dont wait for now
}

resource "kubernetes_config_map" "django-cms-psql-configmap" {
    metadata {
        name = "django-cms-psql-configmap"
        namespace = kubernetes_namespace.django-cms.metadata[0].name
        labels = {
           app = "postgres"
        }
    }

    data = {
        POSTGRES_DB = "awesomedb"
        POSTGRES_USER = "amazinguser"
        POSTGRES_PASSWORD = "perfectpassword"
    }
}

resource "kubernetes_service" "django-cms-psql" {
    metadata {
      name = "django-cms-psql"
      namespace = kubernetes_namespace.django-cms.metadata[0].name
      labels = {
        app = "django-cms"
        tier = "backend"
      }
    }
    spec {
        port {
          port        = 5432
          target_port = 5432
        }
        selector = {
          app  = "django-cms"
          tier = kubernetes_replication_controller.django-cms-psql-rc.spec[0].selector.tier
        }
        type = "LoadBalancer"
    }
}

resource "kubernetes_replication_controller" "django-cms-psql-rc" {
   metadata {
      name = "django-cms-psql-rc"
      namespace = kubernetes_namespace.django-cms.metadata[0].name
      labels = {
         app = "django-cms"
         tier = "backend"
      }
   }
   spec {
      selector = {
         app  = "django-cms"
         tier = "psql"
      }
      template {
          container {
             image = "arm64v8/postgres"
             name  = "psql"

             env_from {
                 config_map_ref {
                    name = kubernetes_config_map.django-cms-psql-configmap.metadata[0].name
                 }
             }

             port {
                container_port = 5432
                name           = "psql"
             }

             volume_mount {
                name       = "pgdata"
                mount_path = "/var/lib/psql/data"
             }
          }

          volume {
             name = "pgdata"
             persistent_volume_claim {
                claim_name = kubernetes_persistent_volume_claim.django-cms-psql-pvc.metadata[0].name
             }
          }
      }
   }
}

resource "kubernetes_replication_controller" "django-cms" {
    metadata {
        name = "django-cms"
        namespace = kubernetes_namespace.django-cms.metadata[0].name
        labels = {
            app = "django-cms"
        }
    }

    spec {
        selector = {
            app  = "django-cms"
            tier = "frontend"
        }
        template {
            container {
              image = "ozacas/django-cms-arm64:v0.1.7"
              name  = "django-cms-arm64"

              env {
                 name = "POSTGRES_HOST"
                 value = kubernetes_service.django-cms-psql.spec[0].cluster_ip
              }
              env {
                 name = "POSTGRES_PORT"
                 value = kubernetes_service.django-cms-psql.spec[0].port[0].port
              }
              env_from {
                 config_map_ref {
                    name = kubernetes_config_map.django-cms-psql-configmap.metadata[0].name
                 }
              }

              port {
                 container_port = 8000
                 name           = "django-cms"
              }

              resources {
                 limits {
                     memory = "1G"
                 }
              }
            }
        }
    }
}

resource "kubernetes_service" "django-cms" {
    metadata {
        name = "django-cms-service"
        namespace = kubernetes_namespace.django-cms.metadata[0].name
    }

    spec {
        selector = {
            app = kubernetes_replication_controller.django-cms.metadata.0.labels.app
        }
        session_affinity = "ClientIP"
        port {
            port        = 8000
            target_port = 8000
        }

        type = "LoadBalancer"
    }
}
