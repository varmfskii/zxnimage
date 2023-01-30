ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=allocate.o col_dist.o deallocate.o decimate.o misc.o palette.o	\
	plus3dos.o readbm.o readpal.o readrgb.o rgb2index.o		\
	writeixed.o writergb.o writezxn.o

ifeq ($(SHARED),1)
CFLAGS+=-fPIC
all : libzxntools.so

install: all
	mkdir -p $(PREFIX)/lib/
	$(CP) libzxntools.so $(PREFIX)/lib/

libzxntools.so : $(OBJS)
	$(CC) -shared -o $@ $^


test : test.o libzxntools.so
	$(CC) -o $@ $< $(LOPTS) -L. -lzxntools -lnetpbm
else
all : libzxntools.a

install: all
	mkdir -p $(PREFIX)/lib/
	$(CP) libzxntools.a $(PREFIX)/lib/

libzxntools.a : $(OBJS)
	$(AR) cr $@ $^


test : test.o libzxntools.a
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm
endif


col_dist.o : col_dist.c zxntools.h
deallocate.o : deallocate.c zxntools.h
decimate.o : decimate.c zxntools.h
misc.o : misc.c zxntools.h
plus3dos.o : plus3dos.c
palette.o : palette.c zxntools.h
readbm.o : readbm.c zxntools.h
readpal.o : readpal.c zxntools.h
readrgb.o : readrgb.c zxntools.h
rgb2index.o : rgb2index.c zxntools.h
test.o : test.c zxntools.h 
writeixed.o : writeixed.c zxntools.h
writergb.o : writergb.c zxntools.h
writezxn.o : writezxn.c zxntools.h

.PHONY : clean distclean all

clean :
	$(RM) $(OBJS) test.o dec.ppm ixed.pgm ixed.ppm pal.raw rgb.ppm *~

distclean : clean
	$(RM) test libzxntools.a libzxntools.so


ifeq ($(SHARED),1)
else
endif
