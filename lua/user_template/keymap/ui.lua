local bind = require("keymap.bind")
local map_cr = bind.map_cr

return {
	["n|<C-n>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|<C-p>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
}
