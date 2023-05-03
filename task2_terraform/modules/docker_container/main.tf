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
  count = var.container_count
  name  = "${var.container_name}${count.index}"

  ports {
    internal = var.internal_port
    external = var.external_port + count.index
  }

  env = [
    "ENVIRONMENT_VAR = ${var.environment}"
  ]

  memory = var.environment == "dev" ? 128 : 256
}