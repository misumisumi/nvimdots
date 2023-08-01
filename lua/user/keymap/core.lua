local bind = require("keymap.bind")
local map_cr = bind.map_cr
local plug_map = {}

plug_map = {
	["n|<A-S-q>"] = "",
	["v|J"] = "",
	["v|K"] = "",
	["n|<C-S-q>"] = map_cr("q!"):with_desc("edit: Force quit"),
}

return plug_map
