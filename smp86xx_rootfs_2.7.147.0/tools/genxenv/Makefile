ifneq '$(filter -DEM86XX_CHIP=EM86XX_CHIPID_TANGO2, $(RMCFLAGS))' ''
ifneq '$(filter -DEM86XX_MODE=EM86XX_MODEID_STANDALONE, $(RMCFLAGS))' ''
CROSS := mipsel-linux-
else
CROSS :=
endif
else
CROSS :=
endif

CFLAGS += -O2
ifeq '$(filter release, $(COMPILKIND))' ''
CFLAGS += -g
else
CFLAGS += -DNDEBUG
endif

SRC_H := xenv.h
OBJS := genxenv.o xenv.o sha1sum.o

TARGETS := genxenv

CC := $(CROSS)$(CC)

all: $(TARGETS)

clean:
	$(RM) -f $(TARGETS) *.o *~

genxenv: $(OBJS)

%.o: %.c $(SRC_H)

