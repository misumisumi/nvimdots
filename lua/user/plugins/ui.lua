local ui = {}

ui["petertriho/nvim-scrollbar"] = {
	lazy = true,
	dependencies = {
		{
			"kevinhwang91/nvim-hlslens",
			config = require("user.configs.ui.nvim-hlslens"),
		},
	},
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("user.configs.ui.nvim-scrollbar"),
}

return ui
