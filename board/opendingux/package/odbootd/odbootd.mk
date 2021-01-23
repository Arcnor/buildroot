################################################################################
#
# odbootd
#
################################################################################

ODBOOTD_VERSION = 89100ed
ODBOOTD_SITE = $(call github,opendingux,odbootd,$(ODBOOTD_VERSION))

HOST_ODBOOTD_DEPENDENCIES = host-libusb host-libopk

ODBOOTD_CONF_OPTS = -DWITH_ODBOOT_CLIENT:BOOL=OFF
HOST_ODBOOTD_CONF_OPTS = -DWITH_ODBOOTD:BOOL=OFF

ifeq ($(HOST_ODBOOTD_EMBEDDED_KERNEL),y)
	HOST_ODBOOTD_DEPENDENCIES += linux
	HOST_ODBOOTD_CONF_OPTS += -DEMBEDDED_INSTALLER=$(BINARIES_DIR)/$(LINUX_IMAGE_NAME)
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
