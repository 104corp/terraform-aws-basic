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

#######
# Cloudtrail
#######

variable "enable_logging" {
  default     = "true"
  description = "Enable logging for the trail"
}

variable "enable_log_file_validation" {
  default     = "true"
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
}

variable "is_multi_region_trail" {
  default     = "false"
  description = "Specifies whether the trail is created in the current region or in all regions"
}

variable "include_global_service_events" {
  default     = "false"
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
}