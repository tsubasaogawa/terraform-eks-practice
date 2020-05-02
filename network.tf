resource "aws_vpc" "terra_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "terra-vpc"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "terra-public1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terra_vpc.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.public.id
}