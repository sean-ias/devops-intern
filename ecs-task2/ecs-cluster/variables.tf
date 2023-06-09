# provider vars
# variable "aws_region" {
#   type        = string
#   default     = "us-east-1"
#   description = "Configuring AWS provider's region"
# }

# variable "aws_access_key" {
#   type        = string
#   sensitive   = true
#   description = "Configuring AWS access key ID"
# }

# variable "aws_secret_key" {
#   type        = string
#   sensitive = true
#   description = "Configuring AWS secret key"
# }

# vpc vars
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for our main VPC"
}

variable "availability_zones" {
  type        = string
  default     = "us-east-1a"
  description = "Availability zone for our VPC"
}

variable "app_count" {
  type        = number
  default     = 1
  description = "Number of tasks"
}
