# Security Group Rules

# Allow SSH Traffic on Port 22 from Bastion Host SG

resource "aws_security_group_rule" "amqp-rule" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  security_group_id = aws_security_group.amqp-sg.id
  source_security_group_id  = aws_security_group.bastion-sg.id

}

resource "aws_security_group_rule" "cron-rule" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  security_group_id = aws_security_group.cron-sg.id
  source_security_group_id  = aws_security_group.bastion-sg.id
  
}

resource "aws_security_group_rule" "main-rule" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  security_group_id = aws_security_group.main-sg.id
  source_security_group_id  = aws_security_group.bastion-sg.id
  
}

# Allow HTTP Traffic on Port 80 from Load Balancer SG

resource "aws_security_group_rule" "allow-http-rule" {
  type              = "ingress"
  to_port           = 80
  protocol          = "tcp"
  from_port         = 80
  security_group_id = aws_security_group.main-sg.id
  source_security_group_id  = aws_security_group.alb-sg.id
  
}

# RDS Ingress Allow Rules from (amqp, main, cron) EC2 SG

resource "aws_security_group_rule" "rds-allow-amqp" {
  type              = "ingress"
  to_port           = 5432
  protocol          = "tcp"
  from_port         = 5432
  security_group_id = aws_security_group.rds-sg.id
  source_security_group_id  = aws_security_group.amqp-sg.id 
}


resource "aws_security_group_rule" "rds-allow-cron" {
  type              = "ingress"
  to_port           = 5432
  protocol          = "tcp"
  from_port         = 5432
  security_group_id = aws_security_group.rds-sg.id
  source_security_group_id  = aws_security_group.cron-sg.id 
}


resource "aws_security_group_rule" "rds-allow-main" {
  type              = "ingress"
  to_port           = 5432
  protocol          = "tcp"
  from_port         = 5432
  security_group_id = aws_security_group.rds-sg.id
  source_security_group_id  = aws_security_group.main-sg.id
}

# Redis Ingress Allow Rules

resource "aws_security_group_rule" "redis-allow-main" {
  type              = "ingress"
  to_port           = 6379
  protocol          = "tcp"
  from_port         = 6379
  security_group_id = aws_security_group.redis-sg.id
  source_security_group_id  = aws_security_group.main-sg.id
}

resource "aws_security_group_rule" "redis-allow-cron" {
  type              = "ingress"
  to_port           = 6379
  protocol          = "tcp"
  from_port         = 6379
  security_group_id = aws_security_group.redis-sg.id
  source_security_group_id  = aws_security_group.cron-sg.id
}

resource "aws_security_group_rule" "redis-allow-amqp" {
  type              = "ingress"
  to_port           = 6379
  protocol          = "tcp"
  from_port         = 6379
  security_group_id = aws_security_group.redis-sg.id
  source_security_group_id  = aws_security_group.amqp-sg.id
}
