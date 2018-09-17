terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature
}

data "aws_caller_identity" "current" {}

######
# IAM
######

data "template_file" "trust_saml" {
  template = "${file("${path.module}/policies/trust_saml.json")}"

  vars {
    trust_account_id   = "${data.aws_caller_identity.current.account_id}"
    saml_provider_name = "${var.saml_provider_name}"
  }
}

data "template_file" "describe_all" {
  template = "${file("${path.module}/policies/describe_all.json")}"

  vars {
    trust_account_id   = "${aws_dynamodb_table.asmweb_api_log.arn}"
    saml_provider_name = "azure-sso"
  }
}