resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "terraform-lc-backend"
  image_id      = "ami-056a29f2eddc40520"
  instance_type = "t2.micro"
  key_name      = "hp"
 user_data = <<EOF
#!/bin/bash

sudo apt update
sudo apt install -y nginx
EOT
  tags = {
    Name = "jeff-userdata"
  }
	}

EOF
security_groups = [aws_security_group.vec-prd-sg-bastion.id]
lifecycle {
create_before_destroy = true
  }
}
# Auto-Scaling 그룹 생성
resource "aws_autoscaling_group" "vec-prd-asg" {
  name                      = "vec-prd-asg"
  launch_configuration      = aws_launch_configuration.as_conf.name
  vpc_zone_identifier       = [aws_subnet.vec-prd-nginx-subnet-2a.id, aws_subnet.vec-prd-nginx-subnet-2c.id]
  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 3
  health_check_grace_period = 120
  health_check_type         = "ELB"
  target_group_arns    = [aws_lb_target_group.vec-prd-tg.arn]
  lifecycle {
    create_before_destroy = true
  }
}