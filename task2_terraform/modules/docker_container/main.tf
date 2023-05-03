terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.12"
}

resource "docker_container" "container" {
  image = var.container_image
  name  = var.container_name

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  env = [
    "ENVIRONMENT_VAR = ${var.environment}"
  ]
  
  memory = var.environment == "dev" ? 128 : 256
}