resource "aws_security_group" "main" {
  name        = "${var.prefix}-sg"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.main.id

  tags = merge({ "Name" : "${var.prefix}-sg" }, var.default_tags)
}

resource "aws_vpc_security_group_ingress_rule" "ingress_main" {
  security_group_id = aws_security_group.main.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = [var.user_ip]
}

resource "aws_vpc_security_group_egress_rule" "egress_main" {
  security_group_id = aws_security_group.main.id
  ip_protocol       = "-1" # semantically equivalent to all ports
  cidr_ipv4         = "0.0.0.0/0"
}
