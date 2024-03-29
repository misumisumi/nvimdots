local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_callback = bind.map_callback

return {
	["n|<A-S-q>"] = "",
	["v|J"] = "",
	["v|K"] = "",
	["n|<A-h>"] = "",
	["n|<A-l>"] = "",
	["n|<A-j>"] = "",
	["n|<A-k>"] = "",
	["n|<C-p>"] = "",
	["n|<C-S-q>"] = map_cr("q!"):with_desc("edit: Force quit"),
	["n|<C-S-P>"] = map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
}
