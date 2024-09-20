#
# Data:		2006/04/19 12:00
# Author:	Jan Faigl
#
# General Makefile

ifdef MK_DIR
-include $(MK_DIR)/paths.mk
else
-include ../Mk/paths.mk
-include ../../Mk/paths.mk
endif


version: configure $(TEX_SOURCES)
	@$(ECHO) "Retrieve directory SVN Revision"
	@$(ECHO) "\newcommand{\SVNRevision}{" >> $(MAKECONFIG)
	@$(SVN_INFO) | $(GREP) "Last Changed Rev" | $(AWK) -v FS=: '{print "Revision" $$2}' >> $(MAKECONFIG)
	@\$(ECHO) "}" >> $(MAKECONFIG)
