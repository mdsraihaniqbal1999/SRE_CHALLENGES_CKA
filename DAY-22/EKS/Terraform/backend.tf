terraform {
  backend "s3" {
    bucket  = "terraform-test-aws-78922"
    key     = "azuremonitoring/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = "true"
    assume_role = {
      role_arn = "arn:aws:iam::<account_number>:role/github_actions_oidc_role"
    }
  }
}
