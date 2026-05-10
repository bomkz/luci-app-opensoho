-- SPDX-License-Identifier: GPL-2.0-only
--
-- LuCI CBI model for luci-app-opensoho
--

local m, s, o

m = Map("opensoho",
	translate("OpenSOHO"),
	translate("OpenSOHO is a lightweight network management system. " ..
	          "Configure all required fields and enable the service below."))

s = m:section(TypedSection, "opensoho", translate("OpenSOHO Settings"))
s.anonymous  = true
s.addremove  = false

-- Tabs must be declared before any taboption calls.
s:tab("general", translate("General"))
s:tab("auth",    translate("Authentication"))
s:tab("network", translate("Network"))

-- ── General ──────────────────────────────────────────────────────────────

o = s:taboption("general", Flag, "enabled",
	translate("Enable OpenSOHO"),
	translate("Start the OpenSOHO service on boot. " ..
	          "Ensure all required fields are configured before enabling."))
o.enabled  = "1"
o.disabled = "0"
o.default  = "0"
o.rmempty  = false

-- ── Authentication ────────────────────────────────────────────────────────

o = s:taboption("auth", Value, "shared_secret",
	translate("Shared Secret"),
	translate("Secret key used for service authentication. " ..
	          "Must be changed from the default before the service will start."))
o.password    = true
o.rmempty     = false
o.placeholder = translate("Enter a secure secret key")

o = s:taboption("auth", Value, "admin_email",
	translate("Admin Email"),
	translate("Administrator login e-mail. " ..
	          "Does not need to be a real address."))
o.rmempty     = false
o.placeholder = "admin@example.com"
o.datatype    = "minlength(3)"

o = s:taboption("auth", Value, "admin_password",
	translate("Admin Password"),
	translate("Administrator login password. Minimum 8 characters."))
o.password    = true
o.rmempty     = false
o.placeholder = translate("Enter a secure password")
o.datatype    = "minlength(8)"

-- ── Network ───────────────────────────────────────────────────────────────

o = s:taboption("network", Value, "http_address",
	translate("Listen Address"),
	translate("IP address the HTTP server binds to. " ..
	          "Use 0.0.0.0 to listen on all interfaces."))
o.default     = "0.0.0.0"
-- ip4addr (not ipaddr) is the correct datatype here: it validates IPv4
-- addresses including the any-address 0.0.0.0.  The generic ipaddr type
-- also accepts IPv6 notation, which this option does not support.
o.datatype    = "ip4addr"
o.rmempty     = false

o = s:taboption("network", Value, "http_port",
	translate("HTTP Port"),
	translate("Port number for the OpenSOHO web interface."))
o.default     = "8080"
o.datatype    = "port"
o.rmempty     = false

return m
