resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "ecr_access_policy" {
  name = "ecr_access_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:repository/myecr-hw1"
      }
    ]
  })
}

resource "aws_iam_policy" "secrets_manager_access_policy" {
  name = "secrets_manager_access_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:secretsmanager:us-west-2:${data.aws_caller_identity.current.account_id}:secret:test/ecs/secret-XmMEuv"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_access_attachment" {
  policy_arn = aws_iam_policy.ecr_access_policy.arn
  role       = aws_iam_role.ecs_task_execution_role.name
}

resource "aws_iam_role_policy_attachment" "secrets_manager_access_attachment" {
  policy_arn = aws_iam_policy.secrets_manager_access_policy.arn
  role       = aws_iam_role.ecs_task_execution_role.name
}