.PHONY: test

help: ## shows help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
scaffold: ## create a new project scaffold
	@echo "Enter project name: "; \
	read projectName; \
	source _setup/create_scaffold.sh $$projectName;
delete: ## deletes a project scaffold
	@echo "Enter project name: "; \
	read projectName; \
	read -p "Are you sure you want to delete $$projectName? (y/n): " confirm; \
	if [ $$confirm = "y" ]; then \
		source _setup/delete_scaffold.sh $$projectName; \
	fi
build: ## build a project to be run
	@echo "Enter project name: "; \
	read projectName; \
	echo "Building project $$projectName..."; \
	docker build . -t $$projectName -f $$projectName/operation/Dockerfile --build-arg PROJECT_NAME=$$projectName; \
	echo "";
run: ## run a project
	@echo "Enter project name: "; \
	read projectName; \
	echo "Running project $$projectName..."; \
	docker run -it --network="host" --rm $$projectName /bin/bash;
start: ## start a project
	@echo "Enter project name: "; \
	read projectName; \
	echo "Starting project $$projectName..."; \
	docker build . -t $$projectName -f $$projectName/operation/Dockerfile --build-arg PROJECT_NAME=$$projectName; \
	docker run -it --network host --rm $$projectName /bin/bash;
lint: ## perform linting on a project
	@echo "Enter project name: "; \
	read projectName; \
	echo "Linting $$projectName...";
clean: ## clean up a project
	@echo "Enter project name: "; \
	read projectName; \
	echo "Cleaning up project $$projectName...";
test: ## run tests on a project
	@echo "Enter project name: "; \
	read projectName; \
	echo "Running tests for $$projectName..."; \

