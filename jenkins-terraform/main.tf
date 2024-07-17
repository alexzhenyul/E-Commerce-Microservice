resource "aws_iam_role" "jenkins_role" {
  name = "Jenkins-terraform"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "role_attachment" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "Jenkins-terraform"
  role = aws_iam_role.jenkins_role.name
}


resource "aws_security_group" "jenkins-sg" {
  name        = "Jenkins Security Group"
  description = "Open 22,443,80,8080,9000"

  # Define a single ingress rule to allow traffic on all specified ports
  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

resource "aws_instance" "jenkins" {
  ami                    = "ami-09871461b40a093ff" # Ubuntu 24.04 LTS 
  instance_type          = var.instance_types
  key_name               = "devops"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  user_data              = templatefile("./installation.sh", {})
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "jenkins-argo"
  }

  root_block_device {
    volume_size = 30
  }
}