ifneq ($(IMAGE_MK),1)
include ../image.mk
endif
OBJS=shrtopbm.o shrtobm.o

all: libzxntools shrtopbm

shrtopbm : $(OBJS)
	$(CC) -o $@ $^ $(LOPTS) -lnetpbm

shrtopbm.o : shrtopbm.c shrtopbm.h
shrtobm.o : shrtobm.c shrtopbm.h

shrtopbm.h : ../libzxntools/zxntools.h
	touch $@

.PHONY : clean distclean libzxntools

clean :
	$(RM) $(OBJS)  *~

distclean : clean
	$(RM) shrtopbm

libzxntools :
	$(MAKE) -C ../libzxntools

install: all
	$(CP) shrtopbm $(PREFIX)/bin/
