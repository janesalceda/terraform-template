output alb_arn { 
    value = aws_lb.alb.arn
}
output alb_tg_arn { 
    value = aws_lb_target_group.tg.*.arn
}
output alb_sg_ids { 
    value = aws_security_group.alb-sg.id
}