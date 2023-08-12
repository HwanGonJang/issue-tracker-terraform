### ECS Service
resource "aws_ecs_service" "api" {
  name            = var.ecs_name
  cluster         = var.ecs_cluster_name
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

  tags = { Name: var.ecs_name }
}

### ECS Task Definition
resource "aws_ecs_task_definition" "service" {
  family = var.ecs_name
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  task_role_arn = var.ecs_task_role_arn
  execution_role_arn = var.ecs_task_execution_role_arn

  cpu       = var.ecs_service_cpu
  memory    = var.ecs_service_memory

  container_definitions = jsonencode([
    {
      name      = var.ecs_name
      image     = "${var.ecr_repository_url}:latest"
      cpu       = var.ecs_service_cpu
      memory    = var.ecs_service_memory
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
    cpu_architecture        = var.cpu_architecture
  }
}