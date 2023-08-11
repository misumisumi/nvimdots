local ui = {}

ui["petertriho/nvim-scrollbar"] = {
	lazy = true,
	dependencies = {
		{
			"kevinhwang91/nvim-hlslens",
			config = require("ui.nvim-hlslens"),
		},
	},
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.nvim-scrollbar"),
}

return ui
