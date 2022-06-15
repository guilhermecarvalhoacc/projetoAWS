
resource "aws_eip" "nat1_gui" {
  depends_on = [aws_internet_gateway.main_gui]
}

resource "aws_eip" "nat2_gui" {
  depends_on = [aws_internet_gateway.main_gui]
}

