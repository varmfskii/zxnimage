ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=pbmtoshr.o bmtoshr.o

all: libzxntools pbmtoshr

pbmtoshr : $(OBJS)
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

pbmtoshr.o : pbmtoshr.c pbmtoshr.h
bmtoshr.o : bmtoshr.c pbmtoshr.h

pbmtoshr.h : ../libzxntools/zxntools.h
	touch $@

.PHONY : clean distclean libzxntools

clean :
	$(RM) $(OBJS)  *~

distclean : clean
	$(RM) pbmtoshr

libzxntools :
	$(MAKE) -C ../libzxntools

install: all
	$(CP) pbmtoshr $(PREFIX)/bin
