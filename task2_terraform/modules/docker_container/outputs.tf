output "container_count" {
  value       = length(var.containers)
  description = "Number of running containers"
}

output "container_outputs" {
  value = [
    for c in docker_container.container : {
      image         = c.image
      name          = c.name
      # we are using try command to handle the case where our c.ports is empty because we didnt want to assign external port, so if it is empty it will choose null decision.
      internal_port = try(c.ports[0].internal, null)
      external_port = try(c.ports[0].external, null)
      environment   = c.env
      memory        = c.memory
      net           = c.network_mode
    }
  ]
  description = "Output for all attributes of a Docker container"
}