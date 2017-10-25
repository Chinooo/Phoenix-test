provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "web" {
  connection {
    user        = "ubuntu"
    agent       = true
    private_key = "${file("${var.ssh_key_name}.pem")}"
  }
  subnet_id = "${var.subnet_id}"
  instance_type = "${var.instance_type}"
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  tags {
    "Name" = "${var.instance_name}"
  }
}
