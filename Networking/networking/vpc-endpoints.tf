resource "aws_security_group" "endpoint_sg" {
  name        = "${var.prefix}-vpc-endpoints-sg"
  description = "Security group for VPC endpoints"
  vpc_id      = aws_vpc.main.id
  tags        = merge({ "Name" : "${var.prefix}-sg" }, var.default_tags)
}

resource "aws_vpc_security_group_ingress_rule" "endpoints_ingress" {
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  security_group_id            = aws_security_group.endpoint_sg.id # Allow traffic from the Instance security group
  referenced_security_group_id = aws_security_group.main.id
}

resource "aws_vpc_security_group_egress_rule" "endpoints_egress" {
  security_group_id = aws_security_group.endpoint_sg.id
  ip_protocol       = "-1" # semantically equivalent to all ports
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.us-east-1.ssm"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_sg.id]
  subnet_ids          = [aws_subnet.private.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.us-east-1.ssmmessages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_sg.id]
  subnet_ids          = [aws_subnet.private.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2_messages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_sg.id]
  subnet_ids          = [aws_subnet.private.id]
  private_dns_enabled = true
}
