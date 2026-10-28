# Commands
.PHONY: install fmt lint type test check build

install: ## Create the venv, install deps and git hooks
	uv sync
	uv run pre-commit install

fmt: ## Format code and apply safe lint fixes
	uv run ruff format .
	uv run ruff check --fix .

lint: ## Lint and check formatting (no changes)
	uv run ruff check .
	uv run ruff format --check .

type: ## Static type checks
	uv run mypy

test: ## Run tests with coverage
	uv run pytest

check: lint type test ## Everything CI runs

build: ## Build wheel and sdist into dist/
	uv build
