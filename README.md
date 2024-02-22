################################################
#                    DAY 1                     #
################################################
###              REQUIREMENTS                ###
################################################
#
- docker installed.  
- ansible installed (if possible all module or install ansible-galaxy collection install community.aws as the playbook uses some aws modules e.g: ansible-galaxy collection install community.aws ).
- terraform installed. 
- configure your terminal with aws configure or if not you may need to do some IAM prep works for you (using assume role which is not part of this tutorial)(considering this is your day 0/1 for the project) I mean no sarcastic but you need admin privilege account in the beginning right?  
- create secrets in secret manager in AWS, prefer manual in console or aws cli for security reason you dont want this always automated or part of terraform, believe me, been there, not even backend remote of tfstate can save you in audit...so... IMHO on this step needs human element > create secret manager in aws console/cli.  
#
#
#change string character #change before running below  
- edit ansiblesource and tfsource file accordingly before running below commands  
#
#
#additional note:    
- update TF_VAR_roleAdm="#change" will be the name of the role to be created during deployment of TF  
- update main.tf you need to update app name in ecr as well as the name for rds tf seems to have limitation least on the current latest version on parsing variable name into argument "identifier" for resource aws_rds_instance  
- source ansiblesource  
- source tfsource  
- ansible-playbook hl_project.yaml  
#
#
#terraform provisioning  
terraform fmt  
terraform validate  
terraform plan  
terraform apply  

#################################################
#                    DAY 2/BAU                  #
#################################################
WIP CICD  













# testonly
