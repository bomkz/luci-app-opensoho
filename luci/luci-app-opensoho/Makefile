# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Your Name <your.email@example.com>
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-opensoho
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-opensoho
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI interface for OpenSOHO
  URL:=https://github.com/rubenbe/opensoho
  MAINTAINER:=Your Name <your.email@example.com>
  DEPENDS:=+luci-base +luci-compat +opensoho +rpcd
  LICENSE:=GPL-2.0-only
  PKGARCH:=all
endef

define Package/luci-app-opensoho/description
  LuCI web interface for OpenSOHO configuration.
  Provides a GUI for managing OpenSOHO settings under Services > OpenSOHO
  in the OpenWrt admin panel.
endef

# Pure Lua/files package — no C source to compile.
define Build/Compile
endef

define Package/luci-app-opensoho/install
	# Lua controller
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/controller/opensoho.lua \
		$(1)/usr/lib/lua/luci/controller/opensoho.lua

	# CBI model
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/model/cbi/opensoho.lua \
		$(1)/usr/lib/lua/luci/model/cbi/opensoho.lua

	# rpcd ACL — grants LuCI permission to read/write the opensoho UCI config
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./files/usr/share/rpcd/acl.d/luci-app-opensoho.json \
		$(1)/usr/share/rpcd/acl.d/luci-app-opensoho.json
endef

$(eval $(call BuildPackage,luci-app-opensoho))