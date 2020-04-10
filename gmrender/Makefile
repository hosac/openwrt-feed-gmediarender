# https://github.com/hosac | hosac@gmx.net

include $(TOPDIR)/rules.mk

PKG_NAME:=gmediarender
PKG_VERSION:=2020-01-10
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hzeller/gmrender-resurrect.git
PKG_SOURCE_VERSION:=26d8f7edf5336bc30f7334c6ad459bf7f4f90ff2

PKG_LICENSE:=GPL-2.0

PKG_FIXUP:=autoreconf
PKG_INSTALL=1

PKG_REMOVE_FILES:=aclocal.m4

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/$(PKG_NAME)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:= +glib2 +libupnp +gst1-libav
  TITLE:=Headless UPnP Renderer
endef

# Notes:
# 1. "gst1-libav" enables "gstreamer1-plugins-base", "gstreamer1-libs" and some modules/libraries automatically, but all of "base" have to be activated MANUALLY!
# 2. "gstreamer1-plugins-good" has to be activated with all modules/libraries MANUALLY!
# 3. Now I was able to stream to my OpenWrt
# 4. Nevertheless the recommendation of the developers is to install all plugins (base/good/bad/ugly) and the modules/libraries...

define Package/$(PKG_NAME)/description
  Resource efficient UPnP/DLNA renderer, optimal for Raspberry Pi, CuBox or a general MediaServer. Fork of GMediaRenderer to add some features to make it usable. 
endef

CONFIGURE_ARGS+= \
  --with-build-cc="$(HOSTCC)" \
  --prefix="\usr"

define Package/$(PKG_NAME)/install
	# Application
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/

	# Using own init script because the original is for the Pi
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/gmediarender.init $(1)/etc/init.d/gmediarender

	# Copy the .png files from sources for device logo
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)
	$(CP) $(PKG_BUILD_DIR)/data/*.png $(1)/usr/share/$(PKG_NAME)/

	# Enable service after flashing
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/set-gmediarender-enabled.sh $(1)/etc/uci-defaults/

endef

$(eval $(call BuildPackage,$(PKG_NAME)))
