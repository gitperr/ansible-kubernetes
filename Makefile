# Makefile for creating a Python virtual environment and installing dependencies

# Variables
VENV := source venv/bin/activate && 
REQUIREMENTS := requirements.txt
VAULT := --vault-password-file .ansible_vault_key
LIMIT := $(if $(limit),--limit=$(limit),)

# Target: install dependencies from requirements.txt
install:
	$(VENV) venv/bin/pip install -r $(REQUIREMENTS);

# Target: clean up virtual environment
clean:
	rm -rf venv

venv:
	python3 -m venv venv

# Target: help - display available targets
help:
	@echo "Available targets:"
	@echo "  make venv        - Create a Python virtual environment"
	@echo "  make install     - Install dependencies from requirements.txt"
	@echo "  make clean       - Clean up virtual environment"
	@echo "  make help        - Display this help message"

# Default target: display help
.DEFAULT_GOAL := help

# Ansible targets
ANSIBLE := $(VENV) ansible-playbook
INVENTORY := -i inventories/hosts.ini
############################
### Installation 		 ###
############################
general-config: install
	$(ANSIBLE) general-config.yml $(INVENTORY) $(VAULT)

k3s: install
	$(ANSIBLE) k3s.yml $(INVENTORY) $(VAULT) $(LIMIT)

kube-prometheus: install
	$(ANSIBLE) kube-prometheus.yml $(INVENTORY) $(VAULT) $(LIMIT)

nginx-ingress: install
	$(ANSIBLE) nginx-ingress.yml $(INVENTORY) $(VAULT) $(LIMIT)

prometheus-operator: install
	$(ANSIBLE) prometheus-operator.yml $(INVENTORY) $(VAULT) $(LIMIT)

prometheus-operator-example: install
	$(ANSIBLE) prometheus-operator-example.yml $(INVENTORY) $(VAULT) $(LIMIT)

docker-registry: install 
	$(ANSIBLE) docker-registry.yml $(INVENTORY) $(VAULT) $(LIMIT)

weather-station: install 
	$(ANSIBLE) weather-station.yml $(INVENTORY) $(VAULT) $(LIMIT)		

########################
### Removal          ###
########################
# TODO
# remove-k3s: install
# 	$(ANSIBLE) remove-k3s.yml $(INVENTORY) $(VAULT) $(LIMIT)	

remove-kube-prometheus: install
	$(ANSIBLE) remove-kube-prometheus.yml $(INVENTORY) $(VAULT) $(LIMIT)

remove-nginx-ingress: install
	$(ANSIBLE) remove-nginx-ingress.yml $(INVENTORY) $(VAULT) $(LIMIT)

remove-prometheus-operator: install
	$(ANSIBLE) remove-prometheus-operator.yml $(INVENTORY) $(VAULT) $(LIMIT)	

remove-docker-registry: install 
	$(ANSIBLE) remove-docker-registry.yml $(INVENTORY) $(VAULT) $(LIMIT)

remove-weather-station: install 
	$(ANSIBLE) remove-weather-station.yml $(INVENTORY) $(VAULT) $(LIMIT)	