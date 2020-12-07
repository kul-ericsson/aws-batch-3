# Terraform Commands
- `terraform init`               # to Init Terraform Project in Current Directory to Download all terraform plugins related to Providers
- `terraform validate`           # To Compile the Code
- `terraform plan`               # to Dry Run
- `terraform apply`              # to trigger the code in environment
- `terraform apply -var varName=varValue` # to trigger the code with varibales on run time
- `terraform apply -auto-approve` # provide approval for resource creation as default
- `terraform destory -auto-approve` # Delete all the resource procured using `terraform apply` command
- `terraform output` # to print outputs exposed in the Terraform Project"

** Added Version.tf with the respective provider detail for provider, Hashicorp made some changes in 0.14 related to 0.13upgrade command **