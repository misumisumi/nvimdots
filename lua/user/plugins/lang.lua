local lang = {}

lang["epwalsh/obsidian.nvim"] = {
	version = "*",
	lazy = true,
	ft = "markdown",
	cmd = {
		"ObsidianDailies",
		"ObsidianNew",
		"ObsidianOpen",
		"ObsidianSearch",
		"ObsidianTags",
		"ObsidianToday",
		"ObsidianTomorrow",
		"ObsidianYesterday",
		"ObsidianNewFromTemplate",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "oflisback/obsidian-bridge.nvim", enabled = false, config = require("user.configs.lang.obsidian-bridge") },
	},
	config = require("user.configs.lang.obsidian"),
}
lang["HakonHarnes/img-clip.nvim"] = {
	enabled = false,
	lazy = true,
	ft = { "markdown", "tex", "typst", "rst", "asciidoc" },
	keys = {
		{ "<leader><leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
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
	opts = require("user.configs.lang.jupynium"),
}

return lang
