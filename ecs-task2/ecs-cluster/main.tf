  # ECS Cluster
  resource "aws_ecs_cluster" "ecs-cluster" {
    name = "my-ecs-cluster"

    tags = {
      owner     = "Shokhrukh"
      component = "Task2-ECS-nginx"
    }
  }

  # service
  resource "aws_ecs_service" "ecs-service" {
    name            = "my-ecs-service"
    cluster         = aws_ecs_cluster.ecs-cluster.id
    task_definition = aws_ecs_task_definition.ecs-task.arn
    desired_count   = var.app_count
    launch_type     = "FARGATE"

    network_configuration {
      subnets          = [aws_subnet.pub_subnet.id]
      security_groups  = [aws_security_group.sg.id]
      assign_public_ip = true
    }
  }

  # task
  resource "aws_ecs_task_definition" "ecs-task" {
    family                   = "my-ecs-task"
    container_definitions    = <<DEFINITION
      [
          {
              "name": "nginx-container",
              "image": "149345317534.dkr.ecr.us-east-1.amazonaws.com/myecr-hw1:my-nginx-v2",
              "essential": true,
              "cpu": 128,
              "memory": 256,
              "environment": [
                  {"name": "SIMPLE_ENV_VAR", "value": "Hello World"}
              ],
              "secrets": [
                  {
                      "name": "SECRET_ENV_VAR",
                      "valueFrom": "arn:aws:secretsmanager:us-west-2:149345317534:secret:test/ecs/secret-XmMEuv"
                  }
              ],
              "portMappings": [
                  {
                      "containerPort": 80,
                      "hostPort": 80
                  }
              ]
          }
      ]
  DEFINITION
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    memory                   = 512
    cpu                      = 256
    execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  }