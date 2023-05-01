output my_passwd {
  description = "The list of passwords"
  value       = [for value in random_password.passwd_generator[*].result : nonsensitive(value)]
}