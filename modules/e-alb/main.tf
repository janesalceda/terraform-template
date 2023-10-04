# Create a new load balancer
resource "aws_lb" "alb" {
  name               = var.mod_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = var.mod_public_subnet_id

  enable_deletion_protection = false

  tags = merge(
    local.gbl_tag ,
    {
        Name        = var.mod_alb_name
    })
}

#TARGET GROUP
resource "aws_lb_target_group" "tg" {
  name     = var.mod_lb_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.mod_vpc_id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#SECURITY GROUP
resource "aws_security_group" "alb-sg" {
  name        = var.mod_lb_sg_name
  description = "For ALB"
  vpc_id      = var.mod_vpc_id

  ingress {
    description      = "mj.salceda-ipinaws"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["203.126.64.67/32"]
  }
  ingress {
    description      = "mj.salceda-whatsmyip"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["203.126.64.70/32"]
  }
   ingress {
    description      = "mj.salceda-staticip"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["107.105.147.23/32"]
  }
  ingress {
    description      = "SRPH IP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["203.126.64.69/32"]
  }
  ingress {
    description      = "SRPH IP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["203.126.64.64/29"]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.mod_alb_name
  }
}

resource "aws_route53_record" "www" {
  zone_id = var.mod_route_53_id
  name    = var.mod_route53_record
  type    = "CNAME"
  ttl     = 60
  records = [aws_lb.alb.dns_name]
}