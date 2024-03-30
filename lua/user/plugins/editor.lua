local editor = {}

editor["max397574/better-escape.nvim"] = {
	lazy = true,
	opts = require("user.configs.editor.better-escape"),
	event = "InsertEnter",
}
editor["ntpeters/vim-better-whitespace"] = {
	lazy = true,
	event = "BufWritePre",
	config = require("user.configs.editor.better-whitespace"),
}
editor["kylechui/nvim-surround"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("user.configs.editor.nvim-surround"),
}
editor["danymat/neogen"] = {
	lazy = true,
	dependencies = "nvim-treesitter/nvim-treesitter",
	cmd = "Neogen",
	opts = require("user.configs.editor.neogen"),
}

return editor
