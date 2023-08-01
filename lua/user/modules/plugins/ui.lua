local ui = {}

ui["petertriho/nvim-scrollbar"] = {
	dependencies = {
		{
			"kevinhwang91/nvim-hlslens",
			config = require("ui.nvim-hlslens"),
		},
	},
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.nvim-scrollbar"),
}

-- Disable default plugin
ui["karb94/neoscroll.nvim"] = {
	enabled = false,
}
ui["dstein64/nvim-scrollview"] = {
	enabled = false,
}

return ui
