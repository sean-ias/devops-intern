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
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:TagResource",
          "ecr:UntagResource",
          "ecr:BatchGetImage"
        ]
        Effect   = "Allow"
        Resource = "149345317534.dkr.ecr.us-east-1.amazonaws.com/myecr-hw1"
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
        Resource = "arn:aws:secretsmanager:us-west-2:149345317534:secret:test/ecs/secret-XmMEuv"
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