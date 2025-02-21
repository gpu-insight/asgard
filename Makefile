.PHONY: all clean help summary

asgard-dir  	:= third-party
asgard-subdirs 	:= $(dir $(wildcard $(asgard-dir)/*/*))
asgard-subdirs 	:= $(filter-out %/bin/, $(sort $(asgard-subdirs)))

MAKESELF 		:= $(abspath $(asgard-dir)/makeself/makeself.sh)
LABEL			:= "Asgard Makes An Easy Life"
# The dot is in terms of asgard-dir
STARTUP_SCRIPT 	:= ./setup.sh
OUTPUT 			:= asgard.run

.PHONY : help summary asgard clean
.DEFAULT_GOAL := help

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

asgard: $(OUTPUT)
asgard: ## Create a self-extracting archive named `asgard.run`

# ignore potential broken symlinks in dependencies
$(OUTPUT): $(shell find $(asgard-dir) ! -type l)
	$(MAKESELF) $(asgard-dir) $@ $(LABEL) $(STARTUP_SCRIPT)

summary: ## List third-party tools we have collected so far
	@echo 'Third-party development tools or plugins archived in "$(OUTPUT)"'
	@./utils/tree.sh $(asgard-dir)/bin/
	@$(foreach a, $(asgard-subdirs), printf "%s\\n" $(a);)

clean:
	$(RM) $(OUTPUT) *.txt
