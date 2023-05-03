variable "container_name" {
  type        = string
  description = "The name of the Docker container"
}

variable "container_image" {
  type        = string
  description = "The Docker image to use for the container"
}

variable "internal_port" {
  type        = number
  description = "The internal port for the Docker container"
}

variable "external_port" {
  type        = number
  description = "The external port for the Docker container"
}

variable "environment" {
  type        = string
  description = "The environment (dev, prod, etc.) for the Docker container"
}