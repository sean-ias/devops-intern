output "container_image" {
  value       = docker_container.container.image
  description = "The name of the Docker name"
}

output "container_name" {
  value       = docker_container.container.name
  description = "The name of the Docker container"
}

output "container_id" {
  value       = docker_container.container.id
  description = "The ID of the Docker container"
}

output "container_internal_port" {
  value       = docker_container.container.ports[0].internal
  description = "The Docker container's internal port"
}

output "container_external_port" {
  value       = docker_container.container.ports[0].external
  description = "The Docker container's external port"
}

output "container_env" {
  value       = docker_container.container.env
  description = "The Docker container's environment"
}

output "container_memory_limit" {
  value       = docker_container.container.memory
  description = "The memory limit for the Docker container (in MB)"
}