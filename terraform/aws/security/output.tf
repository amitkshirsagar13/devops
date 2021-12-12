output "sg_id" {
    value = "${aws_security_group.sg.id}"
}

output "sg_name" {
    value = "${aws_security_group.sg.name}"
}

output "sg_arn" {
    value = "${aws_security_group.sg.arn}"
}

output "access_key" {
    value = "${var.access_key}"
}
