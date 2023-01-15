resource "aws_security_group" "main" {
  description = "Control EC2 inbound and outbound access"
  name        = "main"
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}
