resource "aws_subnet" "public_gui1_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.0.0/18"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                      = "public_gui1_1a"
    "kubernetes.io/role/elb"    = 1
    "kubernetes.io/cluster/eks-gui" = "shared"
  }
}

resource "aws_subnet" "public_gui2_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.64.0/18"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                      = "public_gui2_1b"
    "kubernetes.io/role/elb"    = 1
    "kubernetes.io/cluster/eks-gui" = "shared"
  }
}

resource "aws_subnet" "private_gui1_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.128.0/18"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                            = "private_gui1_1a"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/eks-gui"       = "shared"
  }
}

resource "aws_subnet" "private_gui2_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.192.0/18"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                            = "private_gui2_1b"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/eks-gui"       = "shared"
  }
}