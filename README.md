# Secure S3 Site

## What
A simple TF module that can be used to stand up a static HTML website on a CloudFront-backed S3 Bucket.  

## Why
Simplifies deployment of secure S3 site using best practices.

## How
- To configure,
  1. Modify `examples/terraform.tfvars` to add your desired variables / credentials and put it in the root directory
    - *Note* `terraform.tfvars` files are ignored in our `.gitignore` to prevent users from committing secrets to their VCS

- To deploy,
  1. Setup AWS Credentials (run `aws configure`, see docs https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
  1. Install TF (I use `tfenv`, found https://github.com/tfutils/tfenv)
  1. Create a `www` folder in your root directory and fill with your static assets (currently supports .html, .css, .js and .png files)
  1. `tf init` in the `tf` directory
  1. `tf plan` and `tf apply` when you're happy with the plan
  1. ???
  1. Profit

## Who
- @rmzi