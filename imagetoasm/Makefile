ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=imagetoasm.o writeasm.o writepgm.o writeraw.o
CFLAGS += -std=gnu99

all: libzxntools imagetoasm

imagetoasm : $(OBJS)
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

imagetoasm.o : imagetoasm.c imagetoasm.h
writeasm.o : writeasm.c imagetoasm.h
writepgm.o : writepgm.c imagetoasm.h
writeraw.o : writeraw.c imagetoasm.h

imagetoasm.h : ../libzxntools/zxntools.h
	touch $@

libzxntools :
	$(MAKE) -C ../libzxntools

.PHONY : all clean distclean libzxntools

clean :
	$(RM) $(OBJS) *~

distclean : clean
	$(RM) imagetoasm

install: all
	$(CP) imagetoasm $(PREFIX)/bin/
