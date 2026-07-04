local completion = {}

completion["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("user.configs.completion.nvim-autopairs"),
}
completion["neovim/nvim-lspconfig"] = {
    cmd = {
        "MasonLock",
        "MasonToolsInstallSync",
        "MasonToolsUpdateSync",
    },
	dependencies = {
		{
			"zapling/mason-lock.nvim",
			opts = require("user.configs.completion.mason-lock"),
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = require("user.configs.completion.mason-tool-installer"),
		},
	},
}
return completion
