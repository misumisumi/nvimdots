local null_ls = require("null-ls")
local btns = null_ls.builtins
return {
	sources = {
		btns.diagnostics.statix,
	},
}
