ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=getpalette.o rgb2pal.o writeasm.o

all: libzxntools getpalette

libzxntools:
	make -C ../libzxntools

getpalette : $(OBJS)
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

getpalette.o : getpalette.c getpalette.h
rgb2pal.o : rgb2pal.c getpalette.h
writeasm.o : writeasm.c getpalette.h

getpalette.h : ../libzxntools/zxntools.h
	touch $@

.PHONY : all clean distclean libzxntools

clean :
	$(RM) $(OBJS)  *~

distclean : clean
	$(RM) getpalette

libzxntools :
	$(MAKE) -C ../libzxntools

install: all
	$(CP) getpalette $(PREFIX)/bin/
