provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-task"
  network_mode            = "bridge"
  requires_compatibilities = ["EC2"]

  container_definitions = jsonencode([
    {
      name      = "my_container"
      image     = "nginx"  # Change to your container image
      memory    = 512
      cpu       = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        },
      ]
    },
  ])
}
