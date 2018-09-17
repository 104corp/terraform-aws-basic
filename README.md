# AWS basic Terraform module

![Build Status](https://travis-ci.com/104corp/terraform-aws-basic.svg?branch=master) ![LicenseBadge](https://img.shields.io/github/license/104corp/terraform-aws-basic.svg)

Terraform module which creates basic resources on AWS.

These types of resources are supported:

* [basic](https://www.terraform.io/docs/providers/aws/r/basic.html)

## Usage

```hcl
module "basic" {
  source = "104corp/basic/aws"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

## Terraform version

Terraform version 0.10.3 or newer is required for this module to work.

## Examples

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|

## Outputs

| Name | Description |
|------|-------------|

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Tests

This module has been packaged with [awspec](https://github.com/k1LoW/awspec) tests through test kitchen. To run them:

1. Install [rvm](https://rvm.io/rvm/install) and the ruby version specified in the [Gemfile](https://github.com/104corp/terraform-aws-basic/blob/master/Gemfile).
2. Install bundler and the gems from our Gemfile:
```
gem install bundler; bundle install
```
3. Test using `bundle exec kitchen test` from the root of the repo.


## Authors

Module is maintained by [104corp](https://github.com/104corp).

## License

Apache 2 Licensed. See LICENSE for full details.

