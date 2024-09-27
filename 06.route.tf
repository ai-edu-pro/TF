resource "aws_route" "vec-prd-pulic-route" {
    route_table_id = aws_route_table.vec-prd-rt-public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vec-prd-igw.id
  
}

resource "aws_route" "vec-prd-private-route01" {
    route_table_id = aws_route_table.vec-prd-rt-private01.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.vec-prd-ngw-01.id  
}

resource "aws_route" "vec-prd-private-route02" {
    route_table_id = aws_route_table.vec-prd-rt-private02.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.vec-prd-ngw-02.id
}