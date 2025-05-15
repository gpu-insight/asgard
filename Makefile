.PHONY: all clean help summary

asgard-dir  	:= third-party
asgard-subdirs 	:= $(dir $(wildcard $(asgard-dir)/*/*))
asgard-subdirs 	:= $(filter-out %/bin/, $(sort $(asgard-subdirs)))

download-dir	:= $(asgard-dir)/download

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

# Makefile is based on timestamp so that download only happens once
pre-download: $(addprefix $(download-dir)/, $(shell cat urls.txt | xargs -n 1 basename))
	@echo 'All files are downloaded to the "download" directory'

# note that the file name is the last part of the URL
# $(@F) is makefile built-in variable that is equivalent to $(basename $@)
$(download-dir)/%: urls.txt
	@set -e; \
	[ -d $(download-dir) ] || mkdir -p $(download-dir)
	@echo 'Checking $@...'
	@set -e; \
	if [ ! -f "$@" ]; then \
		url=$$(grep -F "$(@F)" urls.txt); \
		echo "Downloading $$url"; \
		curl -L -o "$@" "$$url"; \
	else \
		echo "$@ already exists, skipping download"; \
	fi

clean:
	$(RM) $(OUTPUT) $(download-dir)/*
