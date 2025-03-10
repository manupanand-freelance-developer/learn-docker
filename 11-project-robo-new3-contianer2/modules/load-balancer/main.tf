# load balancer

resource "aws_lb" "main" {
  # need to create only when auto scaling group is creating
  #  count = var.asg ? 1: 0
   name = "${var.name}-${var.env}-lb"
   internal =  var.internal
   load_balancer_type = "application"
   security_groups = [aws_security_group.load-balancer.id]
   subnets = var.subnet_ids
   tags = {
     Environment="${var.name}-${var.env}-lb"
   }

  
}

# laod balancer security group
resource "aws_security_group" "load-balancer" {
  # count = var.asg ? 1: 0 # only need to create when ASG is enabled
   name = "${var.name}-${var.env}-alb-sg"
   description = "${var.name}-${var.env}-alb-sg"
   vpc_id = var.vpc_id
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
   }
   ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = var.allow_lb_sg_cidr
   }
   ingress {
    from_port = 443
    to_port =443
    protocol = "TCP"
    cidr_blocks = var.allow_lb_sg_cidr
   }
   
   tags = {
     Name="${var.name}-${var.env}-alb-sg"
   }
}

# redirect http tp https
resource "aws_lb_listener" "public-http" {
    count = var.internal ? 0:1
    load_balancer_arn = aws_lb.main.arn

    port = "80"
    protocol = "HTTP"
  default_action {
    type = "redirect"
    redirect{
        port="443"
        protocol="HTTPS"
        status_code ="HTTP_301"
      }
  }
  
  
}

resource "aws_lb_listener" "main" {
  # count = var.internal ? 0:1
  load_balancer_arn = aws_lb.main.arn
  port = var.listener_port
  protocol = var.listener_protocol 
  ssl_policy = var.ssl_policy
  certificate_arn = var.acm_https_arn
  #previouslu each have one lb- ned to send to particular target group
  default_action { # someone hit without proper configuration will get this 500
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Configuration Error /Input is not as expected"
      status_code = "500"
    }
    
  }
}

# load balancer listener rule
# resource "aws_lb_listener" "internal-http" {
#   count = var.internal ? 1: 0
#   load_balancer_arn = aws_lb.main.arn
#   port = "80"
#   protocol = "HTTP"
#    default_action { 
#     type = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       message_body = "Configuration Error /Input is not as expected"
#       status_code = "500"
#     }
    
#   }
# }
