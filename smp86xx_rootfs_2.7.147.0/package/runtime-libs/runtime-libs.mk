ifndef RUNTIME_LIBS_MK
RUNTIME_LIBS_MK := 1

rtlib_list := \
    ld-uClibc-0.9.27.so \
    ld-uClibc.so.0 \
    libuClibc-0.9.27.so \
    libc.so.0 \
    libc.so \
    libdl-0.9.27.so \
    libdl.so.0 \
    libdl.so \
    libgcc_s.so.1 \
    libgcc_s.so \
    libm-0.9.27.so \
    libm.so.0 \
    libm.so \
    libcrypt-0.9.27.so \
    libcrypt.so.0 \
    libcrypt.so \
    libstdc++.so.6.0.2 \
    libstdc++.so.6 \
    libstdc++.so \
    libpthread-0.9.27.so \
    libpthread.so.0 \
    libpthread.so \
    libnsl-0.9.27.so \
    libnsl.so.0 \
    libnsl.so \
    libresolv-0.9.27.so \
    libresolv.so.0 \
    libresolv.so \
    libutil-0.9.27.so \
    libutil.so.0 \
    libutil.so 
 
toolchain_rtlib_list := $(rtlib_list:%=$(SMP86XX_TOOLCHAIN_PATH)/lib/%)
target_rtlib_list := $(rtlib_list:%=$(TARGET_DIR)/lib/%)

.PHONY: echo-rtlib-debug
echo-rtlib-debug:
	@echo toolchain_rtlib_list = $(toolchain_rtlib_list)
	@echo target_rtlib_list = $(target_rtlib_list)

$(target_rtlib_list): $(TARGET_DIR)/lib/%: $(SMP86XX_TOOLCHAIN_PATH)/lib/%
	cp -d $< $@
	mipsel-linux-strip $@

.PHONY: install-runtime-libs
install-runtime-libs: $(target_rtlib_list)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
TARGETS += install-runtime-libs

endif
