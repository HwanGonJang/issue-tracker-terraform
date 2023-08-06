resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.name_prefix

  tags = { Name: "${local.name_prefix}-cluster" }
}

### ECS Service
resource "aws_ecs_service" "api" {
  name            = local.name_prefix
  cluster         = aws_ecs_cluster.ecs_cluster.name
  task_definition = aws_ecs_task_definition.service.arn
  enable_execute_command = true
  launch_type     = "FARGATE"
  desired_count   = 1

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    subnets         = [aws_subnet.private-a.id, aws_subnet.private-c.id]
    security_groups = [aws_security_group.ecs_security_group.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
    container_name = var.ecs_name
    container_port = var.backend_port
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      desired_count,
      load_balancer
    ]
  }

  service_connect_configuration {
    log_configuration {
      log_driver = "awslogs"
    }
    enabled = false
  }

  tags = { Name: local.name_prefix }
}

### ECS Task Definition
resource "aws_ecs_task_definition" "service" {
  family = var.ecs_name
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  task_role_arn = data.aws_iam_role.ecs_task_role.arn
  execution_role_arn = data.aws_iam_role.ecs_task_execution_role.arn

  cpu       = 1024
  memory    = 4096

  container_definitions = jsonencode([
    {
      name      = var.ecs_name
      image     = "${data.aws_ecr_repository.ecr_repository.repository_url}:latest"
      cpu       = 1024
      memory    = 4096
      essential = true
      portMappings = [
        {
          containerPort = var.backend_port
          hostPort      = var.backend_port
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-create-group": "true"
          "awslogs-group" = "ecs/${var.ecs_name}"
          "awslogs-region" = var.region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "ARM64"
  }
}