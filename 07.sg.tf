resource "aws_security_group" "vec-prd-sg-bastion" {
    name = "vec-prd-sg-bastion"
    description = "for bastion Server"
    vpc_id = aws_vpc.vec-prd-vpc.id
    tags = {
      "Name" = "vec-prd-sg-bastion"
    }
}

resource "aws_security_group_rule" "vec-prd_sg-bastion-ssh" {
    security_group_id = aws_security_group.vec-prd-sg-bastion.id
    type = "ingress"
    description = "allow all for ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  
}


resource "aws_security_group_rule" "vec-prd_sg-bastion-http" {
    security_group_id = aws_security_group.vec-prd-sg-bastion.id
    type = "ingress"
    description = "allow all for http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  
}

resource "aws_security_group_rule" "vec-prd_sg-bastion-https" {
    security_group_id = aws_security_group.vec-prd-sg-bastion.id
    type = "ingress"
    description = "allow all for https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  
}

resource "aws_security_group_rule" "vec-prd-sg-bastion-egress" {
    security_group_id = aws_security_group.vec-prd-sg-bastion.id
    type = "egress"
    description = "allow all for all outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  
}


#### elb sg
resource "aws_security_group" "vec-prd-sg-elb" {
    name = "vec-prd-sg-elb"
    description = "for load balancer"
    vpc_id = aws_vpc.vec-prd-vpc.id
    tags = {
      "Name" = "vec-prd-sg-elb"
    }  
}

resource "aws_security_group_rule" "vec-prd-sg-elb-ingress" {
    security_group_id = aws_security_group.vec-prd-sg-elb.id
    type = "ingress"
    description = "allow all http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "vec-prd-sg-elb-egress" {
    security_group_id = aws_security_group.vec-prd-sg-elb.id
    type = "egress"
    description = "allow all"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  
}





