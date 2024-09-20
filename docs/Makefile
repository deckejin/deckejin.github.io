all: publications news awards community education media other skills teaching

publications:
	@$(ECHO) "Update publications"
	ruby scripts/bibpub.rb

news:
	@$(ECHO) "Update news"
	ruby scripts/bibnews.rb

education:
	@$(ECHO) "Update education"
	ruby scripts/bibedu.rb

awards:
	@$(ECHO) "Update awards"
	ruby scripts/bibawards.rb


media:
	@$(ECHO) "Update media"
	ruby scripts/bibmedia.rb

community:
	@$(ECHO) "Update community"
	ruby scripts/bibcom.rb

other:
	@$(ECHO) "Update other"
	ruby scripts/bibother.rb
skills:
	@$(ECHO) "Update skills"
	ruby scripts/bibskills.rb

teaching:
	@$(ECHO) "Update teaching"
	ruby scripts/bibtea.rb


clean:
	@$(RM) -r scripts/_site 
	@$(RM) -r _site
	@$(RM) -r _news
	@$(RM) -r _awards
	@$(RM) -r _other
	@$(RM) -r _publications
	@$(RM) -r _media
	@$(RM) -r _teaching
	@$(RM) -r _education
	@$(RM) -r _community
	@$(RM) -r _skills

MK_DIR=Mk
include $(MK_DIR)/common.mk