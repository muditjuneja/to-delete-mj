job "==CHANGE ME==" {
  datacenters = [==CHANGE ME==-data-centers]
  type        = "service"

  # Method to deploy updates to the application
  update {
    # Update no more that two instances at a time
    max_parallel = 1
    # How long a deployment has to be marked as healthy
    # Otherwise it is marked unhealthy
    healthy_deadline = "2m"
    # How long the deployment has to be marked healthy
    # Otherwise it is marked as a failure
    progress_deadline = "5m"

    # Enable automatically reverting to the last stable job on a failed
    # deployment.
    auto_revert = true
  }

  group "==CHANGE ME==-frontend-servers" {
    constraint {
      attribute = "${node.class}"
      value     = "production"
    }
    count = 3

    task "server" {
      driver = "docker"

      resources {
        network {
          port "==CHANGE ME==_frontend" {}
          port "http" {}
        }
      }

      config {
        image = "==CHANGE ME==:$YOUR_SHA"

        auth {
          username = "username_replaced_by_deploy_tool"
          password = "password_replaced_by_deploy_tool"
        }

        labels {
          group = "==CHANGE ME==-frontend"
        }

        port_map {
          ==CHANGE ME==_frontend  = 80
          http              = 80
        }
      }

      service {
        name = "==CHANGE ME==-frontend"
        tags = ["urlprefix-/"]
        port = "http"
        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
