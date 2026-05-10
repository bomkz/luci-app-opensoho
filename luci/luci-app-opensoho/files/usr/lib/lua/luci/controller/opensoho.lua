-- SPDX-License-Identifier: GPL-2.0-only
--
-- LuCI controller for luci-app-opensoho
--
-- Note: do NOT use module("luci.controller.opensoho", package.seeall).
-- That pattern is deprecated since OpenWrt 18.06 and requires luci-compat
-- on current releases.  LuCI discovers this file by convention (the path
-- under luci/controller/) and calls index() directly.
--

local fs = require "nixio.fs"

function index()
	-- Only register the menu entry if the package is actually installed.
	if not fs.access("/etc/config/opensoho") then
		return
	end

	entry(
		{ "admin", "services", "opensoho" },
		cbi("opensoho"),
		_("OpenSOHO"),
		60
	).dependent = true
end
