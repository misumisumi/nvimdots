local bind = require("keymap.bind")
local map_cr = bind.map_cr

return {
	-- Plugin: neogen
	["n|<leader>nf"] = map_cr("Neogen"):with_noremap():with_silent():with_desc("edit: Generate annotation"),
	-- Plugin: nvim-bufdel
	["n|<leader>bD"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),
}
