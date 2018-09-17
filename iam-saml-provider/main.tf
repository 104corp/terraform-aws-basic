resource "aws_iam_saml_provider" "default" {
  name                   = "azure-sso"
  saml_metadata_document = "${file("./file/saml.xml")}"
}
