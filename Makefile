# Public domain Makefile template derived from
#   http://jingram.sdf.org/2014/11/09/a-makefile-template-for-simple-c-projects.html

all:

PROGS := pipes eventfd af_unix af_inet_loopback

CC := cc
CFLAGS := -std=gnu11 -Wall -Wextra -Werror -MMD
LDFLAGS :=
LDLIBS := $(obj-common)
obj-common = main.o

$(PROGS): $(obj-common)

DEPS = $(PROGS:=.d) $(obj-common:.o=.d)

.PHONY: all
all: $(PROGS)

-include $(DEPS)

.PHONY: clean cleaner
clean:
	rm -f $(DEPS) $(obj-common)

cleaner: clean
	rm -f $(PROGS)
