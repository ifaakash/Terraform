# Create routes for traffic from VPC, redirected to Internet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  # Traffic routes to internet is going to NAT
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = merge({ "Name" : "${var.prefix}-private-rt" }, var.default_tags)
}

resource "aws_route_table_association" "private_subnet_aasociation" {
  subnet_id      = aws_subnet.privatae.id
  route_table_id = aws_route_table.private.id
}
