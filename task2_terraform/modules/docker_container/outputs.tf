output "container_count" {
  value       = length(var.containers)
  description = "Number of running containers"
}

output "container_outputs" {
  value = [
    for c in docker_container.container : {
      image         = c.image
      name          = c.name
      internal_port = c.ports[0].internal
      external_port = c.ports[0].external
      environment   = c.env
      memory        = c.memory
    }
  ]
  description = "Output for all attributes of a Docker container"
}