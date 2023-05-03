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