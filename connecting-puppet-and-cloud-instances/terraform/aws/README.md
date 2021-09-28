This directory contains the yaml and Terraform code for provisioning EC2 instances with Relay.

ec2-provision-and-configure-with-bolt.yaml: 

The Relay workflow file.  Add this to your Relay account.  This file defines the steps the workflow takes, all variables you can pass to the workflow along with defaults, location of the repos for the Terraform and Bolt files. 

You'll need to set up the following in Relay:
A Connection for AWS credentials (access key and secret access key)
A Connection for the private RSA key for access the EC2 instance
  

infra/ The Terraform files that define the EC2 instance being provisioned, variables, and defaults.
  infra/main.tf:  Provisions the EC2 instance and grabs variables from variables.tf
  infra/outputs.tf: Outputs the IP address of the provisioned instance
  infra/variables.tf: Defines variables for instance type, AMI, VPC, etc.
