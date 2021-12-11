output {
  value = "${var.team}-${var.level}-${var.region}-${var.name}"
}

output "tags" {
  value = "${merge(local.tags, var.tags)}"
}