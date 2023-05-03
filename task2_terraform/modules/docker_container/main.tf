terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.12"
}

resource "docker_container" "container" {
  count = length(var.containers)

  image = var.containers[count.index].image
  name  = var.containers[count.index].name

  ports {
    internal = var.containers[count.index].internal_port
    external = var.containers[count.index].external_port
  }

  env = [
    "ENVIRONMENT_VAR = ${var.containers[count.index].environment}"
  ]

  memory = var.containers[count.index].environment == "dev" ? 128 : var.containers[count.index].environment == "stage" ? 256 : var.containers[count.index].environment == "prod" ? 512 : "invalid"
}