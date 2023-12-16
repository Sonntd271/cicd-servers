# Setting up Jenkins, kOps, and SonarQube servers for CICD

This terraform configuration is intended to automate the entire setup to a certain extent, including:
<br> <br>
**Sonar:** `SonarQube` server
<br>
**Jenkins:** `Jenkins` server and `Docker` plugins
<br>
**kOps:** Downloading `kOps` executable
<br> <br>
If automated setups fail for certain instances, it is preferred to perform manual provisioning on those instances by following the scripts within the scripts directory and commenting out the `provisioner` and `connection` directives within the terraform scripts
<br>
<br>
In order to properly setup, modify the `myip` variable in variables.tf to your ip, as well as the `vpc_id` variable to your preferred vpc id then run
<br>
`terraform plan` and `terraform apply` to review and apply the changes to complete the setup
<hr>
