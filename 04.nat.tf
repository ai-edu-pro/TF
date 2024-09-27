resource "aws_eip" "nat-ip01" {
    vpc = "true"
  
}

resource "aws_eip" "nat-ip02" {
    vpc = "true"
  
}

resource "aws_nat_gateway" "vec-prd-ngw-01" {
    allocation_id = aws_eip.nat-ip01.id
    subnet_id = aws_subnet.vec-prd-nginx-subnet-2a.id
    tags = {
      "Name" = "vec-prd-ngw-01"
    }
  
}

resource "aws_nat_gateway" "vec-prd-ngw-02" {
    allocation_id = aws_eip.nat-ip02.id
    subnet_id = aws_subnet.vec-prd-nginx-subnet-2c.id
    tags = {
      "Name" = "vec-prd-ngw-02"
    }
  
}
