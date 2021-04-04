module("luci.controller.eqos", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/eqos") then
		return
	end
	entry({"admin", "control"}, firstchild(), "Control", 50).dependent = false
	entry({"admin", "control", "eqos"}, cbi("eqos"), _("EQOS"), 15).dependent = true
end
