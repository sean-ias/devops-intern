module "docker_container" {
  source = "./modules/docker_container"

  container_name  = var.container_name
  container_image = var.container_image
  internal_port   = var.internal_port
  external_port   = var.external_port
  environment     = var.environment
}