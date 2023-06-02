output "ecr_url" {
  value       = try(aws_ecr_repository.my_ecr.repository_url, "")
  description = "The ECR URL"
}