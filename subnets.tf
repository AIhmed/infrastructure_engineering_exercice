resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "test public subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "test private subnet"
  }
}
