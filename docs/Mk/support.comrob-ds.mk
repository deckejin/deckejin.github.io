#
# Date:      2018/12/18 12:07
# Author:    Jan Faigl
#

-include $(MK_DIR)/paths.mk

TOUCH_FILE=$(DEST_DIR)/.done-comrob-ds
DEST_DIR=../../fig
SOURCE_FILES=$(addprefix $(EXT_DIR)/,$(FILES))
DEST_FILES=$(addprefix $(DEST_DIR)/,$(FILES))

all: $(DEST_FILES)

copy: all $(TOUCH_FILE)

$(TOUCH_FILE): $(DEST_FILES)
	touch $(TOUCH_FILE)

$(DEST_DIR)/%: $(EXT_DIR)/%
	@echo "Copy '$<' to '$@'"
	@$(CP) -r $< $@

clean:
	$(RM) $(TOUCH_FILE)


cleanall: clean
	$(RM) $(DEST_FILES)

