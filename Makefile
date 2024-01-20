# Makefile for creating a Python virtual environment and installing dependencies

# Variables
VENV := source venv/bin/activate && 
REQUIREMENTS := requirements.txt

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
general-config: install
	$(ANSIBLE) general-config.yml $(INVENTORY)