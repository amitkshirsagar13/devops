output "sg_id" {
    value = "${aws_security_group.sg.id}"
}

output "sg_arn" {
    value = "${aws_security_group.sg.arn}"
}

output "sg_region" {
    value = "${aws_security_group.sg.region}"
}

output "aws_access_key" {
    value = "${var.aws_access_key}"
}
