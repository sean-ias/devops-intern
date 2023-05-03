variable "containers" {
  type = list(object({
    image         = string
    name          = string
    internal_port = number
    external_port = number
    environment   = string
  }))
  description = "All attributes of a Docker container in one variable (image, name, ports, and env)"
}

module "docker_container" {
  source     = "./modules/docker_container"
  containers = var.containers
}

output "number_of_containers" {
  value       = module.docker_container.container_count
  description = "Number of running containers"
}

output "containers" {
  value       = module.docker_container.container_outputs
  description = "Output for all attributes of every Docker container"
}