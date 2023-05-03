output "container_image" {
  value       = module.docker_container.container_image
  description = "The name of the Docker image"
}

output "container_name" {
  value       = module.docker_container.container_name
  description = "The name of the Docker container"
}

output "container_id" {
  value       = module.docker_container.container_id
  description = "The ID of the Docker container"
}

output "container_env" {
  value       = module.docker_container.container_env
  description = "The Docker container's environment"
}

output "container_internal_port" {
  value       = module.docker_container.container_internal_port
  description = "The Docker container's internal port"
}

output "container_external_port" {
  value       = module.docker_container.container_external_port
  description = "The Docker container's external port"
}

output "container_memory_limit" {
  value       = module.docker_container.container_memory_limit
  description = "The memory limit for the Docker container (in MB)"
}