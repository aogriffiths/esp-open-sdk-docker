SUBDIRS := containerimages

all: $(SUBDIRS)

$(SUBDIRS):
	#Change to directory $@ before calling make
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
