resource "aws_security_group" "itay-zrihan-sg-ec2-instance" {
  name        = "itay-zrihan-sg-ec2-instance"
  description = "Security group for EC2 instances"
  vpc_id      = aws_vpc.itay-zrihan-vpc.id

  ingress {
    from_port   = 31234
    to_port     = 31234
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress {
  #   from_port   = 30001
  #   to_port     = 30001
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  
  # ingress {
  #   from_port   = 30002
  #   to_port     = 30002
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  #   ingress {
  #   from_port   = 30003
  #   to_port     = 30003
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  #     ingress {
  #   from_port   = 30004
  #   to_port     = 30004
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

      ingress {
    from_port   = 30005
    to_port     = 30005
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "itay-zrihan-SG"
  }
}
