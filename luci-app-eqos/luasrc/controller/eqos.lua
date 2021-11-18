module("luci.controller.eqos", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/eqos") then
		return
	end
	
	entry({"admin", "control"}, firstchild(), "Control", 50).dependent = false
	entry({"admin", "control", "eqos"}, cbi("eqos"), _("EQOS"), 15).dependent = true
	entry({"admin", "control", "eqos", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e = {}
	e.running = luci.sys.call("ip link | grep ifb >/dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end
