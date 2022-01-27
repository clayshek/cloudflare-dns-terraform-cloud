# cloudflare-dns-terraform-cloud

## Overview
Terraform config template for Cloudflare DNS, with [Terraform Cloud](https://cloud.hashicorp.com/products/terraform) integration via [GitHub Actions](https://github.com/features/actions).

https://blog.clayshekleton.com/Cloudflare-DNS-TF-Cloud-GitHub-Actions/

## Prerequisites
* A [Cloudflare](https://www.cloudflare.com/plans/#overview) hosted DNS zone (free plan is fine)
* [Terraform Cloud](https://cloud.hashicorp.com/products/terraform) Organization account (free plan is fine)

## Usage
* In your Terraform Cloud organization, create new Workspace, of type API-driven workflow
* Fork this repo (suggest a private repo). This uses the [Cloudflare Terraform provider](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)
* Edit cloud.tf, add values for your TF Cloud Organization and Workspace name
* Edit zone-records.auto.tfvars, add values for your Cloudflare zone id, domain suffix, and values for DNS records.
* In Terraform Cloud, [create a new Token](https://app.terraform.io/app/settings/tokens) for GitHub Actions to use
* Add a new Actions [Secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets) to your GitHub repo, named TF_API_TOKEN, for the token created in prior step
* In Cloudflare, create an API token, using "Edit zone DNS" token template, to enable updating the zone in scope
* Add a new Actions Secret to your GitHub repo, named CLOUDFLARE_API_TOKEN for the token created in prior step
* If all is setup correctly, updates to your repo's main branch should start an Action initiated run in Terraform Cloud, and update the Cloudflare DNS zone 

## References: 
* https://learn.hashicorp.com/tutorials/terraform/github-actions
* https://learn.hashicorp.com/collections/terraform/cloud-get-started
* https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
* https://blog.cloudflare.com/getting-started-with-terraform-and-cloudflare-part-1/ 
* https://brendanthompson.com/posts/2021/09/triggering-terraform-cloud-runs-from-github
