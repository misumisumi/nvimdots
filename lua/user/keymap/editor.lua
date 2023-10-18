local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_callback = bind.map_callback
local esc = bind.escape_termcode

return {
	-- Plugin: neogen
	["n|<leader>nf"] = map_cr("Neogen"):with_noremap():with_silent():with_desc("edit: Generate annotation"),
	-- Plugin: nvim-bufdel
	["n|<leader>bD"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),
	-- Plugin: vim-easy-align
	["n|gea"] = map_callback(function()
			return esc("<Plug>(EasyAlign)")
		end)
		:with_expr()
		:with_desc("edit: EasyAlign with delimiter"),
	["x|gea"] = map_callback(function()
			return esc("<Plug>(EasyAlign)")
		end)
		:with_expr()
		:with_desc("edit: EasyAlign with delimiter"),
}
