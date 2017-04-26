SUBDIRS := dependencies source standalone bare serialtools

all: $(SUBDIRS)

$(SUBDIRS):
	#Change to directory $@ before calling make
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
