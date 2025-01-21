local lang = {}

lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
	config = require("user.configs.lang.csv"),
}
lang["dhruvasagar/vim-table-mode"] = {
	lazy = true,
	ft = "markdown",
}
lang["kiyoon/jupynium.nvim"] = {
	lazy = true,
	event = "BufEnter *.ju.*",
	build = function()
		if not vim.fn.filereadable("/etc/NIXOS") then
			return "pip install --user ."
		end
	end,
	opts = require("user.configs.lang.jupynium"),
}

return lang
