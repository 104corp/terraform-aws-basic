#######
# IAM
#######

variable "account_alias" {
  description = "A string of IAM account alias for this account"
  default     = ""
}

variable "create_account_password_policy" {
  description = "A boolean of Whether to create AWS IAM account password policy"
  default     = true
}

variable "iam_max_password_age" {
  description = "A number of days that an user password is valid."
  default     = 0
}

variable "iam_minimum_password_length" {
  description = "A number of minimum length to require for user passwords"
  default     = 12
}

variable "iam_allow_users_to_change_password" {
  description = "A boolean of whether to allow users to change their own password"
  default     = true
}

variable "iam_hard_expiry" {
  description = "A boolean of whether to allow users to change their own password"
  default     = false
}

variable "iam_password_reuse_prevention" {
  description = "A boolean of previous passwords that users are prevented from reusing"
  default     = true
}

variable "iam_require_lowercase_characters" {
  description = "A boolean of whether to require lowercase characters for user passwords"
  default     = true
}

variable "iam_require_uppercase_characters" {
  description = "A boolean of whether to require uppercase characters for user passwords"
  default     = true
}

variable "iam_require_numbers" {
  description = "A boolean of whether to require numbers for user passwords"
  default     = true
}

variable "iam_require_symbols" {
  description = "A boolean of whether to require symbols for user passwords"
  default     = false
}

variable "iam_saml_provider_azure_name" {
  description = "A string of iam saml provider name with azure"
  default     = "azure-sso"
}

variable "iam_saml_provider_azure_file" {
  description = "A string of iam saml provider file with azure"
}