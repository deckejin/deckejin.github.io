#
# Date:      2018/12/18 12:07
# Author:    Jan Faigl
#

-include $(MK_DIR)/paths.mk

DEST_DIR=../../fig
CACHE_DIR=.cache
CACHE_TOUCH_FILE=$(CACHE_DIR)/.done
SOURCE_FILES=$(addprefix $(EXT_DIR)/,$(FILES))
DEST_FILES=$(addprefix $(DEST_DIR)/,$(FILES))
DEST_DIRS=$(addprefix $(DEST_DIR)/,$(DIRS))
CACHE_FILES=$(addprefix $(CACHE_DIR)/,$(FILES))
CACHE_DIRS=$(addprefix $(CACHE_DIR)/,$(DIRS))
CACHE_PACK=cache.zip

all: cache dest_dirs $(DEST_FILES)

copy: all

cache-export: cache
	@echo "Packing cached files within $(CACHE_DIR) directory as $(CACHE_PACK)"
	@$(ZIP) -r $(CACHE_PACK) $(CACHE_DIR)

cache-import: $(CACHE_DIR)
	@echo "Import cache from $(CACHE_PACK) to $(CACHE_DIR)"
	@$(UNZIP) $(CACHE_PACK)
	$(TOUCH) $(CACHE_TOUCH_FILE)

dest_dirs:
	@- $(foreach DIR,$(DEST_DIRS), \
	   if [ ! -d $(DIR) ]; then $(MKDIR) $(DIR); fi;\
	)
$(DEST_DIR)/%: $(CACHE_DIR)/% 
	@echo "Copy '$<' $< to '$@'"
	@$(CP) $< $@

clean:
	$(RM) $(DEST_FILES) 

cleanall: clean
	$(RM) $(CACHE_DIR) 

cache: $(CACHE_DIR) $(CACHE_DIRS) $(CACHE_FILES) $(CACHE_TOUCH_FILE)

cache-force: $(CACHE_DIR)
	$(CP) $(SOURCE_FILES) $(CACHE_DIR)
	$(TOUCH) $(CACHE_TOUCH_FILE)

$(CACHE_DIR):
	$(MKDIR) $(CACHE_DIR)
	$(MKDIR) $(CACHE_DIRS)

$(CACHE_TOUCH_FILE): $(CACHE_DIR) $(CACHE_DIRS) $(CACHE_FILES)
	$(TOUCH) $(CACHE_TOUCH_FILE)

$(CACHE_DIR)/%: $(EXT_DIR)/%
	@echo "Copy '$<' to '$@'"
	@$(CP) $< $@

$(EXT_DIR):
	$(MKDIR) -p $(EXT_DIR)

upload_sync: $(EXT_DIR)
	@echo "Sync local cache with the remote comrob-ds"
	@echo "Are you sure? y/n: " 
	@read confirm; if [ $$confirm != "y" -a $$confirm != "Y" ]; then echo aborting; exit 1; fi
	$(RSYNC) -av $(CACHE_DIR)/ $(EXT_DIR)/ \
