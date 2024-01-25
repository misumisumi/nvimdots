local lang = {}

lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
	config = require("user.configs.lang.csv"),
}
lang["lervag/vimtex"] = {
	lazy = true,
	ft = "tex",
	config = require("user.configs.lang.vimtex"),
}
lang["dhruvasagar/vim-table-mode"] = {
	lazy = true,
	ft = "markdown",
}
lang["kiyoon/jupynium.nvim"] = {
	lazy = true,
	ft = "python",
	build = function()
		if not vim.fn.filereadable("/etc/NIXOS") then
			return "pip install --user ."
		end
	end,
	config = require("user.configs.lang.jupynium"),
}

return lang
