# Security Group Definition

resource "aws_security_group" "alb-sg" {
  name        = "${var.project_name}-${var.environment}-SG-ALB"
  description = "Security Group for Application Load Balancer"
  vpc_id      = var.target_vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "bastion-sg" {
  name        = "${var.project_name}-${var.environment}-SG-Bastion"
  description = "Security Group for Bastion SG Allow port 22"
  vpc_id      = var.target_vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "amqp-sg" {
  name        = "${var.project_name}-${var.environment}-amqp-SG-EC2"
  description = "Security Group for amqp instance"
  vpc_id      = var.target_vpc_id
  depends_on = [
    aws_security_group.bastion-sg,
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "main-sg" {
  name        = "${var.project_name}-${var.environment}-main-SG-EC2"
  description = "Security Group for main instance"
  vpc_id      = var.target_vpc_id
  depends_on = [
    aws_security_group.bastion-sg,
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "cron-sg" {
  name        = "${var.project_name}-${var.environment}-cron-SG-EC2"
  description = "Security Group for cron instance"
  vpc_id      = var.target_vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "rds-sg" {
  name        = "${var.project_name}-${var.environment}-SG-RDS"
  description = "Security Group for RDS allow 5432"
  vpc_id      = var.target_vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "redis-sg" {
  name        = "${var.project_name}-${var.environment}-SG-Redis"
  description = "Security Group for Redis Cluster Allow 6379"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = ""
  }
}
