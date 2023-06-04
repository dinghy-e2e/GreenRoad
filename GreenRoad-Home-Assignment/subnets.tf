resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.itay-zrihan-vpc.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "itay-zrihan-private-us-east-1a"

  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.itay-zrihan-vpc.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "itay-zrihan-private-us-east-1b"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.itay-zrihan-vpc.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "itay-zrihan-public-us-east-1a"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.itay-zrihan-vpc.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "itay-zrihan-public-us-east-1b"
  }
}