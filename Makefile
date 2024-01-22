# Makefile

# List of directories and files to format and lint
TARGETS = pfi/

# Format code using isort and black
format:
	poetry run isort $(TARGETS)
	poetry run black $(TARGETS)

# Lint code using ruff
lint:
	poetry run ruff $(TARGETS)

# Lint code using pylint with parallel execution
pylint:
	poetry run pylint -j 0 $(TARGETS)

# Test code using pytest
test:
	poetry run pytest

# Setup project for development
setup:
	# Install pre-commit hooks
	poetry run pre-commit install --config .config/.pre-commit.yaml
	poetry run pre-commit autoupdate --config .config/.pre-commit.yaml

# Display help message by default
.DEFAULT_GOAL := help
help:
	@echo "Available commands:"
	@echo "  make format      - Format code using isort and black"
	@echo "  make lint        - Lint code using ruff"
	@echo "  make pylint      - Lint code using pylint"
	@echo "  make test        - Run tests using pytest"
	@echo "  make setup       - Setup project for development"

# Declare the targets as phony
.PHONY: format lint pylint test setup help
