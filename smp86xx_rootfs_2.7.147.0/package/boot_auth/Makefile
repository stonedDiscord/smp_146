ifneq '$(filter -DEM86XX_CHIP=EM86XX_CHIPID_TANGO2, $(RMCFLAGS))' ''
ifneq '$(filter -DEM86XX_MODE=EM86XX_MODEID_STANDALONE, $(RMCFLAGS))' ''
CROSS := mipsel-linux-
else
CROSS :=
endif
else
CROSS :=
endif

CFLAGS += -O2 -U__mips__ 
ifeq '$(filter release, $(COMPILKIND))' ''
CFLAGS += -g
else
CFLAGS +=
endif

SRC_H := boot_auth.h sha1.h rsa_enc_dec.h debug.h
OBJS := sha1.o rsa_enc_dec.o

TARGETS := boot_auth

CC := $(CROSS)$(CC)

all: $(TARGETS)

clean:
	$(RM) -f $(TARGETS) *.o *~

boot_auth: $(OBJS)

%.o: %.c $(SRC_H)

