resource "route_table_association" "pub_sub_inet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.inet_acc.id
}

resource "aws_route_table_association" "priv_sub_pub" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route_priv.id
}
