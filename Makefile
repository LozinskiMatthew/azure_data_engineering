.PHONY: run.sh

run.sh:
	@bash run.sh $(filter-out $@,$(MAKECMDGOALS))

# Prevent make from thinking `example_function` is a file
%:
	@:
