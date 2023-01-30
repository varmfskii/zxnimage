ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=ppmtoshc.o writeshc.o

all: libzxntools ppmtoshc

ppmtoshc : $(OBJS)
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

ppmtoshc.o : ppmtoshc.c ppmtoshc.h
writeshc.o : writeshc.c ppmtoshc.h

ppmtoshc.h : ../libzxntools/zxntools.h
	touch $@

.PHONY : clean distclean libzxntools

clean :
	$(RM) $(OBJS)  *~

distclean : clean
	$(RM) ppmtoshc

libzxntools :
	$(MAKE) -C ../libzxntools

install: all
	$(CP) ppmtoshc $(PREFIX)/bin/
