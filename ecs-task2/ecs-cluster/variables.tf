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