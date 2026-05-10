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
  # rpcd is required for the ACL file to take effect (UCI access from LuCI).
  # luci-compat is NOT listed — the controller uses the modern API (no module()).
  # luci-compat is required for the old-style Lua CBI framework (Map, TypedSection,
  # entry, cbi) and for nixio.fs used in the controller.  luci-base alone does not
  # include these on OpenWrt 18.06+.
  DEPENDS:=+luci-base +luci-compat +opensoho +rpcd
  LICENSE:=GPL-2.0-only
  # Pure Lua + JSON — no compiled objects, one package works on all arches.
  PKGARCH:=all
endef

define Package/luci-app-opensoho/description
  LuCI web interface for OpenSOHO configuration.
  Provides a GUI for managing OpenSOHO settings under Services > OpenSOHO
  in the OpenWrt admin panel.
endef

# Pure-data package: nothing to prepare or compile.
define Build/Prepare
endef

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
