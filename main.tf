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

##########################
# IAM for saml provider
##########################

resource "aws_iam_saml_provider" "this" {
  count = "${length(var.iam_saml_provider_azure_file) > 0 ? 1 : 0}"

  name                   = "${var.iam_saml_provider_azure_name}"
  saml_metadata_document = "${var.iam_saml_provider_azure_file}"
}