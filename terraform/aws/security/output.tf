output "sg_id" {
    value = "${aws_security_group.sg.id}"
}

output "sg_arn" {
    value = "${aws_security_group.sg.arn}"
}

output "aws_access_key" {
    value = "${var.aws_access_key}"
}
