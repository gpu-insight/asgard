.PHONY: all clean help

asgard-dir  	:= asgard
asgard-subdirs 	:= $(dir $(wildcard $(asgard-dir)/*/*))
asgard-subdirs 	:= $(sort $(asgard-subdirs))

MAKESELF 		:= $(abspath $(asgard-dir)/makeself/makeself.sh)
LABEL			:= "ASGARD makes an easy life"
# The dot is in terms of asgard-dir
STARTUP_SCRIPT 	:= ./setup.sh
OUTPUT 			:= asgard.run

all: $(OUTPUT)

$(OUTPUT): $(wildcard $(asgard-dir)/*)
	$(MAKESELF) $(asgard-dir) $@ $(LABEL) $(STARTUP_SCRIPT)
	@echo 'Third-party development tools or plugins archived in "$@"'
	@$(foreach a, $(asgard-subdirs), \
		printf "  %-24s archived\\n" $(a);)

clean:
	$(RM) $(OUTPUT)

help:
	$(info Target: all $(OUTPUT) clean help)
