ifneq ($(IMAGE_MK),1)
include ../image.mk
endif

OBJS=allocate.o col_dist.o deallocate.o decimate.o misc.o palette.o	\
	plus3dos.o readbm.o readpal.o readrgb.o rgb2index.o		\
	writeixed.o writergb.o writezxn.o

all : libzxntools.so

install: all
	mkdir -p $(PREFIX)/lib/
	$(CP) libzxntools.so $(PREFIX)/lib/

libzxntools.so : $(OBJS:%=dynamic/%)
	$(CC) -shared -o $@ $^


test : test.o
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

dynamic/%.o : %.c
	$(CC) -c $(CFLAGS) -fPIC -o $@ $<

dynamic/allocate.o : allocate.c zxntools.h
dynamic/col_dist.o : col_dist.c zxntools.h
dynamic/deallocate.o : deallocate.c zxntools.h
dynamic/decimate.o : decimate.c zxntools.h
dynamic/misc.o : misc.c zxntools.h
dynamic/plus3dos.o : plus3dos.c
dynamic/palette.o : palette.c zxntools.h
dynamic/readbm.o : readbm.c zxntools.h
dynamic/readpal.o : readpal.c zxntools.h
dynamic/readrgb.o : readrgb.c zxntools.h
dynamic/rgb2index.o : rgb2index.c zxntools.h
dynamic/test.o : test.c zxntools.h 
dynamic/writeixed.o : writeixed.c zxntools.h
dynamic/writergb.o : writergb.c zxntools.h
dynamic/writezxn.o : writezxn.c zxntools.h

.PHONY : clean distclean all

clean :
	$(RM) $(OBJS) test.o dec.ppm ixed.pgm ixed.ppm pal.raw rgb.ppm *~

distclean : clean
	$(RM) test libzxntools.so
