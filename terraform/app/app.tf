provider "digitalocean" {}

# Create the app platform
resource "digitalocean_app" "tcbo151" {
  spec {
    name   = var.app.name
    region = var.app.region
    
    domain {
      name = "www.${var.app.name}.com"
      type = "PRIMARY"
      zone = "${var.app.name}.com"
    }

    service {
      name               = var.app.name
      environment_slug   = var.app.env
      instance_count     = var.app.instance_count
      instance_size_slug = var.app.size

      github {
        repo = var.app.repo
        deploy_on_push = true
        branch = var.app.branch
      }

      source_dir = "/${var.app.name}"
      build_command = "./run_build.sh"
      run_command = "npm start"
    }

    env {
      key   = "VITE_JSONBIN_API_KEY"
      value = "$$$2b$$$10$$$pA/ASqkuXn1h5R5sDrizg.2M3mwIUNrhf9B2hRXAuLgH5pbP0Rfw."
      type  = "SECRET"
    }

    env {
      key   = "VITE_JSONBIN_COLLECTION_ID"
      value = "6198674562ed886f9151cea6"
      type  = "GENERAL"
    }

    env {
      key   = "PORT"
      value = "8080"
      type  = "GENERAL"
    }

  }
}
