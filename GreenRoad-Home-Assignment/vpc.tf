resource "aws_vpc" "itay-zrihan-vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "itay-zrihan-vpc"
  }
}

resource "aws_internet_gateway" "itay-new-igw" {
  vpc_id = aws_vpc.itay-zrihan-vpc.id

  tags = {
    Name = "itay-zrihan-igw"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "itay-zrihan-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "itay-zrihan-nat"
  }

  depends_on = [aws_internet_gateway.itay-new-igw]
}