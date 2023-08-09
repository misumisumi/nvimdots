local lang = {}

lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
	config = require("lang.csv"),
}
lang["lervag/vimtex"] = {
	lazy = true,
	ft = "tex",
	config = require("lang.vimtex"),
}
lang["dhruvasagar/vim-table-mode"] = {
	lazy = true,
	ft = "markdown",
}

return lang
