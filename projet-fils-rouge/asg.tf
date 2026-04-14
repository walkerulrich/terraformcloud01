data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "my_lt" {
  name          = "my-lt"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  network_interfaces {
    security_groups = [aws_security_group.my_security_group.id]
  }
}

resource "aws_autoscaling_group" "my_asg" {
  name               = "my-asg"
  min_size           = 2
  max_size           = 3
  desired_capacity   = 2
  vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  launch_template {
    id      = aws_launch_template.my_lt.id
    version = "$Latest"
  }
  load_balancers = [aws_elb.my_elb.name]
}