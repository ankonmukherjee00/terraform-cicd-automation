#!/bin/bash

set -e 

configlist=("dev" "prod" "stag")

Env=$1

if [[ -z "$Env"  ]]; then
  echo "Error: Either Env or Config is empty."
  exit 1
fi


found_env=false

for i in "${configlist[@]}"; do
  [[ "$i" == "$Env" ]] && found_env=true
done

if [["$found_env" !=true ]]; then
  echo "Value '$Env' is not in the list: ${configlist[*]}"
  exit 1
fi


echo "Initializing Terraform with backend"
terraform init 

sleep 10s


echo "Running plan for environment: $Env"
terraform plan --var-file=tfvars/$Env.tfvars

echo "Applying Terraform configuration for environment: $Env"
terraform apply --var-file=tfvars/$Env.tfvars --auto-approve