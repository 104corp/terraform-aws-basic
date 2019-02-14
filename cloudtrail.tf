resource "aws_cloudtrail" "centrallog" {
  name                          = "centrallog"
  s3_bucket_name                = "104traillog"
  enable_logging                = "${var.enable_logging}"
  enable_log_file_validation    = "${var.enable_log_file_validation}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"
  include_global_service_events = "${var.include_global_service_events}"
}