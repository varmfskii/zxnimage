ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=ppmtoscr.o writescr.o

all: libzxntools ppmtoscr

ppmtoscr : $(OBJS)
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

ppmtoscr.o : ppmtoscr.c ppmtoscr.h
writescr.o : writescr.c ppmtoscr.h

ppmtoscr.h : ../libzxntools/zxntools.h
	touch $@

.PHONY : clean distclean libzxntools

clean :
	$(RM) $(OBJS)  *~

distclean : clean
	$(RM) ppmtoscr

libzxntools :
	$(MAKE) -C ../libzxntools

install: all
	$(CP) ppmtoscr $(PREFIX)/bin/
