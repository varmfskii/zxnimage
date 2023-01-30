ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=paltoppm.o

all: libzxntools paltoppm

paltoppm : $(OBJS)
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

paltoppm.o : paltoppm.c paltoppm.h

paltoppm.h : ../libzxntools/zxntools.h
	touch $@

.PHONY : clean distclean libzxntools

clean :
	$(RM) $(OBJS)  *~

distclean : clean
	$(RM) paltoppm

libzxntools :
	$(MAKE) -C ../libzxntools

install: all
	$(CP) paltoppm $(PREFIX)/bin/
