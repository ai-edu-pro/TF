resource "aws_vpc" "vec-prd-vpc" {
    cidr_block = "10.250.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      "Name" = "vec-prd-vpc"
    }
}