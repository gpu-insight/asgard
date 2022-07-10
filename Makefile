.PHONY: all clean help summary

asgard-dir  	:= asgard
asgard-subdirs 	:= $(dir $(wildcard $(asgard-dir)/*/*))
asgard-subdirs 	:= $(filter-out %/bin/, $(sort $(asgard-subdirs)))

MAKESELF 		:= $(abspath $(asgard-dir)/makeself/makeself.sh)
LABEL			:= "Asgard Makes An Easy Life"
# The dot is in terms of asgard-dir
STARTUP_SCRIPT 	:= ./setup.sh
OUTPUT 			:= asgard.run

all: $(OUTPUT) summary

# ignore potential broken symlinks in dependencies
$(OUTPUT): $(shell find $(asgard-dir) ! -type l)
	$(MAKESELF) $(asgard-dir) $@ $(LABEL) $(STARTUP_SCRIPT)

summary:
	@echo 'Third-party development tools or plugins archived in "$(OUTPUT)"'
	@./utils/tree.sh $(asgard-dir)/bin/
	@$(foreach a, $(asgard-subdirs), printf "%s\\n" $(a);)

clean:
	$(RM) $(OUTPUT)

help:
	$(info Target: all $(OUTPUT) clean help)
