VAR_FILE := ../../backend.tfvars

# By default, setup and plan, but don't make any changes
all: setup plan

.PHONY: init
init:
	terraform init -backend-config=$(VAR_FILE)

.PHONY: setup
setup:
	terraform get

.PHONY: plan
plan:
	terraform plan -var-file=$(VAR_FILE)

.PHONY: apply
apply:
	terraform apply -var-file=$(VAR_FILE)

.PHONY: destroy
destroy:
	terraform destroy -var-file=$(VAR_FILE)
