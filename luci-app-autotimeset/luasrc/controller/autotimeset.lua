module("luci.controller.autotimeset",package.seeall)
local fs=require"nixio.fs"
local http=require"luci.http"
function index()
	if not nixio.fs.access("/etc/config/autotimeset") then
		return
	end
        entry({"admin", "system"}, firstchild(), "Control", 44).dependent = false
        entry({"admin", "system", "autotimeset"}, alias("admin", "system", "autotimeset", "base"), _("Scheduled Setting"), 20).dependent = true
        entry({"admin", "system", "autotimeset", "base"}, cbi("autotimeset/base"),  _("Scheduled Setting"), 1).leaf = true
        entry({"admin", "system", "autotimeset", "log"}, form("autotimeset/log"), _("Log"), 2).leaf = true
        entry({"admin","system","autotimeset","dellog"},call("dellog"))
        entry({"admin","system","autotimeset","getlog"},call("getlog"))
end


function getlog()
	logfile="/etc/autotimeset/autotimeset.log"
	if not fs.access(logfile) then
		http.write("")
		return
	end
	local f=io.open(logfile,"r")
	local a=f:read("*a") or ""
	f:close()
	a=string.gsub(a,"\n$","")
	http.prepare_content("text/plain; charset=utf-8")
	http.write(a)
end

function dellog()
	fs.writefile("/etc/autotimeset/autotimeset.log","")
	http.prepare_content("application/json")
	http.write('')
end
