resource "aws_launch_template" "lt" {
  name = var.mod_lt_name

  image_id = var.mod_image_id

  iam_instance_profile {
    name = var.mod_iam_instance_profile
  }

  key_name  = var.mod_key_pair

  instance_type = var.mod_instance_type
  
  vpc_security_group_ids = [aws_security_group.asg-sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
          Name        = var.mod_ec2_name
          Owner = var.mod_owner
          Project =var.mod_project
          Team =var.mod_team
    })
  }

  user_data = "${base64encode(file("modules/g-ec2/user_data.txt"))}"
}
resource "aws_security_group" "asg-sg" {
  name        = var.mod_asg_sg_name
  description = "For ASG"
  vpc_id      = var.mod_vpc_id

  ingress {
    description      = "ALB SG"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    # cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [var.mod_alb_sg_ids]
  }
   ingress {
    description      = "TLS from VPC"
    from_port        = 6522
    to_port          = 6522
    protocol         = "tcp"
    cidr_blocks      = ["3.138.181.209/32"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "skillup-asg-sg-mj.salceda-001"
  }
}