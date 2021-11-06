SUBDIRS := linpack stream fio

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)


all: $(SUBDIRS)

clean: $(SUBDIRS)