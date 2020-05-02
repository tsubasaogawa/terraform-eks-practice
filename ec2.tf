data "aws_ssm_parameter" "amzn2_ami_latest" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_security_group" "sg" {
    name = "terra"
    vpc_id = aws_vpc.terra_vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    description = "terra security group"
}

resource "aws_key_pair" "terra" {
  key_name   = "terra"
  public_key = file("id_rsa.pub")
}

resource "aws_instance" "terra" {
  count = 1
  ami = data.aws_ssm_parameter.amzn2_ami_latest.value
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  key_name = "terra"
  subnet_id = aws_subnet.public1.id

  tags = {
    Name = "terra-ec2"
    CreatedBy = "tsubasaogawa"
  }
}
