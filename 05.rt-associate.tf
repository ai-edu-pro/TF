resource "aws_route_table_association" "rt_associate-public01" {
    subnet_id = aws_subnet.vec-prd-nginx-subnet-2a.id
    route_table_id = aws_route_table.vec-prd-rt-public.id 
}

resource "aws_route_table_association" "rt_associate-public02" {
    subnet_id = aws_subnet.vec-prd-nginx-subnet-2c.id
    route_table_id = aws_route_table.vec-prd-rt-public.id
}

resource "aws_route_table_association" "rt_associate-private01" {
    subnet_id = aws_subnet.vec-prd-tomcat-subnet-2a.id
    route_table_id = aws_route_table.vec-prd-rt-private01.id
}

resource "aws_route_table_association" "rt_associate-private02" {
    subnet_id = aws_subnet.vec-prd-tomcat-subnet-2c.id
    route_table_id = aws_route_table.vec-prd-rt-private02.id
}