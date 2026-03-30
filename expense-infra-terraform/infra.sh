#!/bin/bash

# folders=(
# "00-vpc"
# "10-sg"
# "20-bastion"
# "30-rds"
# "40-eks"
# "50-acm"
# "60-alb"
# "70-ecr"
# "80-cdn"
# )

folders=(
"80-cdn"
"70-ecr"
"60-alb"
"50-acm"
"40-eks"
"30-rds"
"20-bastion"
"10-sg"
"00-vpc"
)
for folder in "${folders[@]}"
do
  echo "Running terraform init in $folder"

  cd $folder || exit
  #terraform init -upgrade -reconfigure
  #terraform plan -out=tfplan
  terraform destroy -auto-approve
  cd ..

  echo "Waiting 10 seconds..."
  sleep 10

done
