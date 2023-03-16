# Create SSH key pairs to use on EC2 instances on AWS
resource "aws_key_pair" "my_key" {
  key_name   = "aws-key-tf"
  public_key = file("./aws-key-tf.pub")
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0568936c8d2b91c4e"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name

  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key-tf")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install python3-pip -y",
      "pip install pandas"
    ]
  }

  tags = {
    Name = "instance-terraform"
  }
}

