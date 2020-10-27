provider "kubernetes" {
}

resource "kubernetes_namespace" "django-cms" {
    metadata {
       name = "django-cms"
    }
}

resource "kubernetes_persistent_volume" "django-cms-psql-volume" {
    metadata {
       name = "django-cms-psql-volume"
    }

    spec {
       capacity = {
          storage = "10Gi"
       }
       access_modes = ["ReadWriteOnce"]
       persistent_volume_source {
          csi {
             driver = "topolvm-provisioner"
             volume_handle = "django-cms-psql-volume"
          }
       }
       storage_class_name = "topolvm-provisioner"
    }
}

resource "kubernetes_persistent_volume_claim" "django-cms-psql-pvc" {
    metadata {
       name = "django-cms-psql-pvc"
       namespace = kubernetes_namespace.django-cms.metadata[0].name
    }

    spec {
       access_modes = ["ReadWriteOnce"]
       resources {
          requests = {
             storage = "10Gi"
          }
       }
       volume_name = kubernetes_persistent_volume.django-cms-psql-volume.metadata.0.name
    }
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
        cluster_ip = "None"
    }
}

resource "kubernetes_replication_controller" "django-cms-psql-rc" {
   metadata {
      name = "django-cms-psql-rc"
      namespace = kubernetes_namespace.django-cms.metadata[0].name
      labels = {
         app = "django-cms"
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
                name       = kubernetes_persistent_volume.django-cms-psql-volume.metadata[0].name
                mount_path = "/var/lib/psql/data"
             }
          }

          volume {
             name = kubernetes_persistent_volume.django-cms-psql-volume.metadata[0].name
             persistent_volume_claim {
                claim_name = kubernetes_persistent_volume_claim.django-cms-psql-pvc.metadata[0].name
             }
          }
      }
   }
}
