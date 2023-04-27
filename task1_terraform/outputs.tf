output my_passwd {
  description = "The list of passwords"
  value       = random_password.passwd_generator[*].result
  sensitive   = true
}