
default:
	.SILENT: help.Makefile
scaffold:
	@echo "Enter project name: "; \
	read projectName; \
	source de_projects/setup/create_scaffold.sh $$projectName;
delete:
	@echo "Enter project name: "; \
	read projectName; \
	read -p "Are you sure you want to delete $$projectName? (y/n): " confirm; \
	if [ $$confirm = "y" ]; then \
		source de_projects/setup/delete_scaffold.sh $$projectName; \
	fi
build:
	@read -p "Enter project name: " projectName;
	echo "Building $$projectName..."; \
	echo "$$projectName built."
lint:
	@read -p "Enter project name: " projectName;
	echo "Linting $$projectName..."; \
	# CHECK IF PROJECT EXISTS
	# 	IF EXISTS, LINT PROJECT
	# 	IF NOT, EXIT
	echo "$$projectName linted."
lint-all:
	echo "Linting all projects..." \
	# CHECK IF PROJECTS EXIST
		# IF EXISTS, LINT PROJECTS
		# IF NOT, EXIT
	echo "All projects linted."
clean:
	@read -p "Enter project name: " projectName;
	echo "Cleaning up project $$projectName...";
	# CHECK IF PROJECT EXISTS
	# 	IF EXISTS, CLEAN PROJECT
	# 	IF NOT, EXIT
	echo "$$projectName project cleaned."
clean-all:
	@read -p "Are you sure you want to clean up all projects? (y/n): " confirm; \
	echo "Cleaning up all projects..." \
	# CHECK IF PROJECTS EXIST
		# IF EXISTS, CLEAN PROJECTS
		# IF NOT, EXIT
	echo "All projects cleaned."
test:
	@read -p "Enter project name: " projectName;
	echo "Running tests for $$projectName...";
	# CHECK IF PROJECT EXISTS
	# 	IF EXISTS, RUN TESTS
	# 	IF NOT, EXIT
	echo "Tests for $$projectName ran successfully."
test-all:
	echo "Running tests for all projects..." \
	# CHECK IF PROJECTS EXIST
		# IF EXISTS, RUN TESTS
		# IF NOT, EXIT
	echo "All tests ran successfully."
