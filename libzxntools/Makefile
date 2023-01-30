ifneq ($(IMAGE_MK),1)
include ../image.mk
endif

OBJS=allocate.o col_dist.o deallocate.o decimate.o misc.o palette.o	\
	plus3dos.o readbm.o readpal.o readrgb.o rgb2index.o		\
	writeixed.o writergb.o writezxn.o

export OBJS

all : libzxnimage.a libzxnimage.so

libzxnimage.a : $(OBJS:%.o=%.c) zxntools.h
	make -f static.mk

libzxnimage.so : $(OBJS:%.o=%.c) zxntools.h
	make -f dynamic.mk

install: all
	mkdir -p $(PREFIX)/lib/
	$(CP) libzxntools.a libzxntools.so $(PREFIX)/lib/

.PHONY : clean distclean all

clean :
	$(RM) $(OBJS:%=static/%) $(OBJS:%=dynamic/%) test.o dec.ppm ixed.pgm ixed.ppm pal.raw rgb.ppm *~

distclean : clean
	$(RM) test libzxntools.a libzxntools.so

