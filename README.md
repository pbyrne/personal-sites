Server Setup
============

This repo contains my public code for setting up my personal servers.

Setup
-----

1. Install Terraform. (`brew install terraform` or however you wish.)
2. Ensure `TF_VAR_*` variables are set up as defined in `vars.tf`.
3. Run `./init` to initialize Terraform to use S3 as the shared state source, and to install any dependent plugins.

Usage
-----

#### Review changes

```
terraform plan
```

This reports what changes would happen if you applied them. While this isn't required before applying, it's prudent, so as to avoid accidentally breaking things.

#### Apply changes

```
terraform apply
```

This applies whatever changes are necessary per the updated configuration, if any.
