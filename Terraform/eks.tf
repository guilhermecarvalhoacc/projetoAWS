resource "aws_iam_role" "eks_cluster-gui" {
  name = "eks-cluster-gui"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  role = aws_iam_role.eks_cluster-gui.name
}


resource "aws_eks_cluster" "eks-gui" {
  name = "eks-gui"

  role_arn = aws_iam_role.eks_cluster-gui.arn

  

  vpc_config {
    endpoint_private_access = false

    endpoint_public_access = true

    subnet_ids = [
      aws_subnet.public_gui1_1a.id,
      aws_subnet.public_gui2_1b.id,
      aws_subnet.private_gui1_1a.id,
      aws_subnet.private_gui2_1b.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}