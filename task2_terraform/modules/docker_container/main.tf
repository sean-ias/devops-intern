terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.12"
}

resource "docker_network" "my_cont_net" {
  name = "my_cont_net"
}

resource "docker_container" "container" {
  count = length(var.containers)

  image = var.containers[count.index].image
  name  = var.containers[count.index].name

  network_mode = docker_network.my_cont_net.name

  # for each container ports' check:
  # If external_port is not null, the expression evaluates to [1], which creates one instance of the content block. If external_port is null, the expression evaluates to an empty list ([]), which creates zero instances of the content block, meaning its ports are null, not accessible externally
  dynamic "ports" {
    for_each = var.containers[count.index].external_port != null ? [1] : []
    content {
      internal = var.containers[count.index].internal_port
      external = var.containers[count.index].external_port
    }
  }

  env = [
    "ENVIRONMENT_VAR = ${var.containers[count.index].environment}"
  ]

  memory = var.containers[count.index].environment == "dev" ? 128 : var.containers[count.index].environment == "stage" ? 256 : var.containers[count.index].environment == "prod" ? 512 : "invalid"
}