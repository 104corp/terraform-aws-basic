terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature
}

#########
# data
#########

data "aws_caller_identity" "current" {}

#######
# IAM
#######

resource "aws_iam_account_alias" "this" {
  count = "${length(var.account_alias) > 0 ? 1 : 0}"

  account_alias = "${var.account_alias}"
}

resource "aws_iam_account_password_policy" "this" {
  count = "${var.create_account_password_policy ? 1 : 0}"

  max_password_age               = "${var.iam_max_password_age}"
  minimum_password_length        = "${var.iam_minimum_password_length}"
  allow_users_to_change_password = "${var.iam_allow_users_to_change_password}"
  hard_expiry                    = "${var.iam_hard_expiry}"
  password_reuse_prevention      = "${var.iam_password_reuse_prevention}"
  require_lowercase_characters   = "${var.iam_require_lowercase_characters}"
  require_uppercase_characters   = "${var.iam_require_uppercase_characters}"
  require_numbers                = "${var.iam_require_numbers}"
  require_symbols                = "${var.iam_require_symbols}"
}

#IAM Role Role-Administrator
data "template_file" "Role-Administrator" {
  template = "${file("${path.module}/assume_role_policies/Role-Administrator.json")}"
}
resource "aws_iam_role" "Role-Administrator" {
  name = "Role-Administrator"
  assume_role_policy = "${data.template_file.Role-Administrator.rendered}"
  tags = {
      tag-key = "Name"
      tag-value="Role-Administrator"
  }
}

#IAM Role Role-DescribeOnly
data "template_file" "Role-DescribeOnly" {
  template = "${file("${path.module}/assume_role_policies/Role-DescribeOnly.json")}"
}
resource "aws_iam_role" "Role-DescribeOnly" {
  name = "Role-DescribeOnly"
  assume_role_policy = "${data.template_file.Role-DescribeOnly.rendered}"
  tags = {
      tag-key = "Name"
      tag-value="Role-DescribeOnly"
  }
}
data "template_file" "Role-DescribeOnly-Policy" {
  template = "${file("${path.module}/iam_policies/Role-DescribeOnly.json")}"
}
resource "aws_iam_policy" "Role-DescribeOnly-Policy" {
  name   = "Role-DescribeOnly-Policy"
  policy = "${data.template_file.Role-DescribeOnly-Policy.rendered}"
}
resource "aws_iam_policy_attachment" "Role-DescribeOnly-Policy" {
  name       = "Role-DescribeOnly-Policy"
  roles      = "Role-DescribeOnly"
  policy_arn = "${aws_iam_policy.Role-DescribeOnly-Policy}"
}

#IAM Role Role-Otter
data "template_file" "Role-Otter" {
  template = "${file("${path.module}/assume_role_policies/Role-Otter.json")}"
}
resource "aws_iam_role" "Role-Otter" {
  name = "Role-Otter"
  assume_role_policy = "${data.template_file.Role-Otter.rendered}"
  tags = {
      tag-key = "Name"
      tag-value="Role-Otter"
  }
}
resource "aws_iam_policy_attachment" "AdministratorAccess" {
  name       = "AdministratorAccess"
  roles      = ["${aws_iam_role.Role-DescribeOnly.name}","${aws_iam_role.Role-Otter.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}