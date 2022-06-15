resource "aws_route_table_association" "public1" {
  subnet_id = aws_subnet.public_gui1_1a.id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id = aws_subnet.public_gui2_1b.id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id = aws_subnet.private_gui1_1a.id

  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  subnet_id = aws_subnet.private_gui2_1b.id

  route_table_id = aws_route_table.private2.id
}