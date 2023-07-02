output "db_address" {
  value       = aws_db_instance.my_db_instance.address
  description = "RDS address"
}

output "bastion_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "db_instance_endpoint" {
  value = aws_db_instance.my_db_instance.endpoint
}