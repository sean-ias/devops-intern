variable counts {
  type        = number
  description = "How many random passwords do you want to generate?"
}

# Passwd length should be at least 4, because in the worst case, if a user enables special character, the passwd should be colorful consisting of at least one lowercase, one uppercase, one numeric, and one special character, the sum of which is 4! 
variable length {
  type        = number
  description = "Please type the length of every password"

  validation {
    condition = (var.length > 3)
    error_message = "The password length must be at least 4 characters long!"
  }
}

variable override_special {
  type        = string
  default     = "!@#$%^&*()[]{}<>"
  description = "Special chars to use"
}

variable special {
  type        = bool
  description = "Do you want to include special characters in every password?"
}
