
module("luci.controller.wrtbwmon", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/wrtbwmon") then return end

	if nixio.fs.access("/var/run/wrtbwmon.pid") then
	entry({"admin", "status", "usage"},alias("admin", "status", "usage", "details"), _("Traffic Status"), 60)
	entry({"admin", "status", "usage", "details"}, template("wrtbwmon"),_("Details"), 10).leaf=true
	entry({"admin", "status", "usage", "config"}, arcombine(cbi("wrtbwmon/config")),_("Configuration"), 20).leaf=true
	entry({"admin", "status", "usage", "alias"}, form("wrtbwmon/alias"),_("Alias"), 30).leaf=true
	else
	entry({"admin", "status", "usage"},alias("admin", "status", "usage", "details"), _("Traffic Status"), 60)
	entry({"admin", "status", "usage", "details"}, template("wrtbwmon_"),_("Details"), 10).leaf=true
	entry({"admin", "status", "usage", "config"}, arcombine(cbi("wrtbwmon/config")),_("Configuration"), 20).leaf=true
	entry({"admin", "status", "usage", "alias"}, form("wrtbwmon/alias"),_("Alias"), 30).leaf=true
	end
end
