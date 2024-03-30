local completion = {}

completion["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("user.configs.completion.nvim-autopairs"),
}
completion["neovim/nvim-lspconfig"] = {
	dependencies = {
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = require("user.configs.completion.mason-tool-installer"),
		},
	},
}
return completion
