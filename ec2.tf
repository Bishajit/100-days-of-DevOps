resource "aws_instance" "ec2-100day-day1" {
  ami             = "ami-04505e74c0741db8d"
  instance_type   = "t2.micro"
  key_name        = "technical-assessment"
  security_groups = [aws_security_group.sg-for-ec2-for-100days-day.id]
  subnet_id       = default.id


  tags = {
    Name = "ec2-100day-day1"
  }
}
