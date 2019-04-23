# By default, setup and plan, but don't make any changes
all: setup plan

.PHONY: init
init:
	terraform init

.PHONY: setup
setup:
	terraform get

.PHONY: plan
plan:
	terraform plan -var-file=secrets.tfvars

.PHONY: apply
apply:
	terraform apply -var-file=secrets.tfvars

.PHONY: destroy
destroy:
	terraform destroy -var-file=secrets.tfvars
