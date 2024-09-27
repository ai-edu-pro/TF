### public subnet ####
resource "aws_subnet" "vec-prd-nginx-subnet-2a" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    cidr_block = "10.250.1.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "vec-prd-nginx-subnet-2a"
    } 
}

resource "aws_subnet" "vec-prd-nginx-subnet-2c" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    cidr_block = "10.250.11.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "vec-prd-nginx-subnet-2c"
    } 
}

## pirvate subnet
resource "aws_subnet" "vec-prd-tomcat-subnet-2a" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    cidr_block = "10.250.2.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
      "Name" = "vec-prd-tomcat-subnet-2a"
    } 
}

resource "aws_subnet" "vec-prd-tomcat-subnet-2c" {
    vpc_id = aws_vpc.vec-prd-vpc.id
    cidr_block = "10.250.12.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
      "Name" = "vec-prd-tomcat-subnet-2c"
    } 
}