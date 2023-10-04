resource "aws_autoscaling_group" "asg" {
  count = 1
  vpc_zone_identifier = var.mod_private_subnet_id
  desired_capacity   = var.mod_asg_desired_capacity
  max_size           = var.mod_asg_max_size
  min_size           = var.mod_asg_min_size
  target_group_arns  = var.mod_alb_target_group_arn
  launch_template {
    id      = var.mod_lt_id
    version = var.mod_lt_version
  }
  dynamic "tag" {
    for_each = var.extra_tags
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.value
    }
  }
}