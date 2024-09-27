##public rt

resource "aws_route_table" "vec-prd-rt-public" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    tags = {
      "Name" = "vec-prd-rt-public"
    }
  
}

###private rt
resource "aws_route_table" "vec-prd-rt-private01" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    tags = {
      "Name" = "vec-prd-rt-private01"
    }
}

resource "aws_route_table" "vec-prd-rt-private02" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    tags = {
      "Name" = "vec-prd-rt-private02"
    }
  
}