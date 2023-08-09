local bind = require("keymap.bind")
local map_cr = bind.map_cr

return {
	["n|<A-S-q>"] = "",
	["v|J"] = "",
	["v|K"] = "",
	["n|<C-S-q>"] = map_cr("q!"):with_desc("edit: Force quit"),
}
