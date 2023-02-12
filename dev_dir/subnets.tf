resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.0.224/28"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "priv_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.0.240/28"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet"
  }
}
