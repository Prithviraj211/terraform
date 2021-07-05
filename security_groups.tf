# Security Group Definition 

resource "aws_security_group" "alb-sg" {
  name        = "${var.ProjectName}-${var.Environment}-SG-ALB"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.Vpc_ID

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
  name        = "${var.ProjectName}-${var.Environment}-SG-Bastion"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.Vpc_ID

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
  name        = "${var.ProjectName}-${var.Environment}-amqp-SG-EC2"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.Vpc_ID
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
  name        = "${var.ProjectName}-${var.Environment}-main-SG-EC2"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.Vpc_ID
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
  name        = "${var.ProjectName}-${var.Environment}-cron-SG-EC2"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.Vpc_ID
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

resource "aws_security_group" "rds-sg" {
  name        = "${var.ProjectName}-${var.Environment}-SG-RDS"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.Vpc_ID
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

resource "aws_security_group" "redis-sg" {
  name        = "${var.ProjectName}-${var.Environment}-SG-Redis"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.Vpc_ID
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
