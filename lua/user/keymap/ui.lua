local bind = require("keymap.bind")
local map_cr = bind.map_cr
local M = {}

M["plug_map"] = {
	["n|<C-n>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|<C-p>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
}

-- M["gitsigns"] = function(buf)
-- 	local actions = require("gitsigns.actions")
-- 	return {}
-- end

return M
