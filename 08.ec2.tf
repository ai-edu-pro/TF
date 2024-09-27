resource "aws_eip" "bastion_ip" {
  vpc = true
  tags = {
    "Name" = "bastion_eip"
  }
  instance = aws_instance.vec-prd-ec2-bastion.id
}

resource "aws_instance" "vec-prd-ec2-bastion" {
  ami             = "ami-056a29f2eddc40520"
  instance_type   = "t2.micro"
  vpc_security_group_ids = [aws_security_group.vec-prd-sg-bastion.id]
  subnet_id       = aws_subnet.vec-prd-nginx-subnet-2a.id
  key_name        = "hp"
  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    tags = {
      "Name" = "vec-prd-ec2-bastion"
    }
  }
  tags = {
    "Name" = "vec-prd-ec2-bastion"
  }


}

resource "aws_eip" "nginx_ip" {
  vpc = true
  tags = {
    "Name" = "nginx_eip"
  }
      instance = aws_instance.vec-prd-ec2-nginx.id
}

resource "aws_instance" "vec-prd-ec2-nginx" {
  ami             = "ami-06087749a704b8168"
  instance_type   = "t2.micro"
  vpc_security_group_ids = [aws_security_group.vec-prd-sg-bastion.id]
  subnet_id       = aws_subnet.vec-prd-nginx-subnet-2c.id
  key_name        = "hp"
  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    tags = {
      "Name" = "vec-prd-ec2-nginx"
    }
  }
  tags = {
    "Name" = "vec-prd-ec2-nginx"
  }


}


# Key
# ssh-keygen -m PEM -f hp

resource "aws_key_pair" "key" {
  key_name   = "hp"
  public_key = file("hp.pub")
}