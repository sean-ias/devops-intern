variable "ecr_name" {
  type        = string
  default     = null
  description = "Repository name"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "encrypt_type" {
  type        = string
  default     = "KMS"
  description = "Encryption type"
}

variable "img_mutability" {
  type        = string
  default     = "IMMUTABLE"
  description = "You can configure a repository to turn on tag immutability to prevent image tags from being overwritten."
}

variable "scan_img" {
  type        = bool
  default     = true
  description = "Set up images scanning"
}

variable "ecr_tags" {
  type        = map(string)
  description = "The key-val mappings for tags"
}