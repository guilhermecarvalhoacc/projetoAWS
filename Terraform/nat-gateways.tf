resource "aws_nat_gateway" "NATgw1_gui" {
  allocation_id = aws_eip.nat1_gui.id
  subnet_id     = aws_subnet.public_gui1_1a.id

  tags = {
    Name = "NATgw1_gui"
  }

}

resource "aws_nat_gateway" "NATgw2_gui" {
  allocation_id = aws_eip.nat2_gui.id
  subnet_id     = aws_subnet.public_gui2_1b.id

  tags = {
    Name = "NATgw2_gui"
  }

}