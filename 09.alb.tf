####### lb 생성

resource "aws_lb" "web-lb" {
    name = "web-lb"
    subnets = [ aws_subnet.vec-prd-nginx-subnet-2a.id, aws_subnet.vec-prd-nginx-subnet-2c.id ]
    internal = false
    security_groups = [ aws_security_group.vec-prd-sg-elb.id ]
    load_balancer_type = "application"
    tags = {
      "Name" = "web-lb"
    }
}

############## Target Group

resource "aws_lb_target_group" "vec-prd-tg" {
    name = "vec-prd-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.vec-prd-vpc.id
    health_check {
      port = 80
      path ="/"
    }
    tags = {
      "Name" = "vec-prd-tg"
    }
}

############Listener 

resource "aws_lb_listener" "vec-prd-listener" {
    load_balancer_arn = aws_lb.web-lb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
      target_group_arn = aws_lb_target_group.vec-prd-tg.arn
      type = "forward"
    }
  
}

##### target group attachment
/*
resource "aws_lb_target_group_attachment" "vec-prd-tg-attachment1" {
    target_group_arn = aws_lb_target_group.vec-prd-tg.arn
    target_id = aws_instance.vec-prd-ec2-bastion.id
    port = 80
  
}
*/

