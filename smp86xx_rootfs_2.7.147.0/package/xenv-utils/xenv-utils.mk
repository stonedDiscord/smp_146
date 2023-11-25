genxenv             := genxenv
genxenv_dir         := $(BASE_DIR)/tools/genxenv
genxenv_install_dir := $(TARGET_DIR)/bin

genxenv_bin         := $(genxenv_dir)/$(genxenv)
genxenv_target      := $(genxenv_install_dir)/$(genxenv)

$(genxenv_bin): FORCE
# Set RMCFLAGS to tango2 standalone to force the cross-compilation of genxenv
	RMCFLAGS="-DEM86XX_CHIP=EM86XX_CHIPID_TANGO2 -DEM86XX_MODE=EM86XX_MODEID_STANDALONE -DEM86XX_REVISION=4" COMPILKIND=release $(MAKE) -C $(@D)

$(genxenv_target): $(genxenv_bin)
	mkdir -p $(@D)
	cp $< $@

.PHONY: genxenv
genxenv: $(genxenv_target)

.PHONY: genxenv-clean
genxenv-clean:
	-rm $(genxenv_target)
	$(MAKE) -C $(genxenv_dir) clean

.PHONY: genxenv-dirclean
genxenv-dirclean: genxenv-clean

xbins := \
    tobin.bash
xbin_dir         := $(BASE_DIR)/xbin
xbin_install_dir := $(TARGET_DIR)/bin

xbin_scripts     := $(xbins:%=$(xbin_dir)/%)
xbin_targets     := $(xbins:%=$(xbin_install_dir)/%)

$(xbin_targets): $(xbin_install_dir)/%: $(xbin_dir)/%
	mkdir -p $(@D)
	cp $< $@

.PHONY: xbin
xbin: $(xbin_targets)

.PHONY: xbin-clean
xbin-clean:
	-rm $(xbin_targets)

.PHONY: xbin-dirclean
xbin-dirclean: xbin-clean

.PHONY: xenv-utils
xenv-utils: genxenv xbin

.PHONY: xenv-utils-clean
xenv-utils-clean: genxenv-clean xbin-clean

.PHONY: xenv-utils-dirclean
xenv-utils-dirclean: genxenv-dirclean xbin-dirclean

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq '$(strip $(BR2_PACKAGE_XENV_UTILS))' 'y'
TARGETS += xenv-utils
endif
