######################################
#
# matk
#
######################################

MATK_VERSION = f69e04252c8f192d31e0182af9499a4b226e2117
MATK_SITE = $(call github,brummer10,ModularAmpToolKit.lv2,$(MATK_VERSION))
MATK_BUNDLES = PreAmps.lv2 PreAmpImpulses.lv2 poweramps.lv2 PowerAmpImpulses.lv2

ifdef BR2_cortex_a7
MATK_SSE_CFLAGS = -mfpu=vfpv3
endif

MATK_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE)  SSE_CFLAGS="$(MATK_SSE_CFLAGS)" -C $(@D)

define MATK_BUILD_CMDS
	$(MATK_TARGET_MAKE) mod
endef

define MATK_INSTALL_TARGET_CMDS
	$(MATK_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
