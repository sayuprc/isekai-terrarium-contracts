SHELL := /bin/bash

.DEFAULT_GOAL := help

CONTAINER := isekai-terrarium-contracts

.PHONY: build
build: ## Build docker image for develop environment
	docker build -t isekai-terrarium-contracts:22 .

.PHONY: up
up: ## Start the container
	docker compose up -d

.PHONY: down
down: ## Delete the container
	docker compose down

.PHONY: node
node: ## Enter node container
	docker exec -it ${CONTAINER} bash

.PHONY: npm-install
npm-install: ## Install npm packages
	docker compose run --rm node npm i

.PHONY: check-format
check-format: ## Check code format
	docker exec ${CONTAINER} npm run format:check

.PHONY: fix-format
fix-format: ## Run code formatting
	docker exec ${CONTAINER} npm run format:fix

.PHONY: compile
compile: ## Generate codes
	docker exec ${CONTAINER} npm run compile

.PHONY: compile-watch
compile-watch: ## Generate codes
	docker exec ${CONTAINER} npm run compile:watch

.PHONY: re-compile
re-compile: ## Regenerate codes
	rm -rf generated/oas generated/clients generated/protobuf
	docker exec ${CONTAINER} npm run compile

.PHONY: help
help: ## Display a list of targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
