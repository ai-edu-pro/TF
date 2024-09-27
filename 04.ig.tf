resource "aws_internet_gateway" "vec-prd-igw" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    tags = {
      "Name" = "vec-prd-igw"
    }
  
}