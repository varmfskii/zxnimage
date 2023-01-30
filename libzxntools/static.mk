ifneq ($(IMAGE_MK),1)
include ../image.mk
endif

all : libzxntools.a

install: all
	mkdir -p $(PREFIX)/lib/
	$(CP) libzxntools.a $(PREFIX)/lib/

libzxntools.a : $(OBJS:%=static/%)
	$(AR) cr $@ $^


test : test.o libzxntools.a
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

static/%.o : %.c
	$(CC) -c $(CFLAGS) -o $@ $<

static/allocate.o : allocate.c zxntools.h
static/col_dist.o : col_dist.c zxntools.h
static/deallocate.o : deallocate.c zxntools.h
static/decimate.o : decimate.c zxntools.h
static/misc.o : misc.c zxntools.h
static/plus3dos.o : plus3dos.c
static/palette.o : palette.c zxntools.h
static/readbm.o : readbm.c zxntools.h
static/readpal.o : readpal.c zxntools.h
static/readrgb.o : readrgb.c zxntools.h
static/rgb2index.o : rgb2index.c zxntools.h
static/test.o : test.c zxntools.h 
static/writeixed.o : writeixed.c zxntools.h
static/writergb.o : writergb.c zxntools.h
static/writezxn.o : writezxn.c zxntools.h

.PHONY : clean distclean all

clean :
	$(RM) $(OBJS) test.o dec.ppm ixed.pgm ixed.ppm pal.raw rgb.ppm *~

distclean : clean
	$(RM) test libzxntools.a
