# basic
output "basic_id" {
  description = "The ID of the basic"
  value       = "${element(concat(aws_basic.this.*.id, list("")), 0)}"
}
