data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }
  owners = ["amazon"]
}

resource "aws_iam_role" "main" {
  name               = "${local.prefix}-main"
  assume_role_policy = file("./templates/instance-profile-policy.json")

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "main_attach_policy" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "main" {
  name = "ec2-instance-profile"
  role = aws_iam_role.main.name
}

resource "aws_instance" "main" {
  ami                  = data.aws_ami.amazon_linux.id
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.main.name
  key_name             = var.instance_key_name
  subnet_id            = aws_subnet.public_a.id

  vpc_security_group_ids = [
    aws_security_group.main.id
  ]
}
