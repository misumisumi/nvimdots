local editor = {}

editor["ntpeters/vim-better-whitespace"] = {
	lazy = true,
	event = "BufWritePre",
	config = require("editor.better-whitespace"),
}
editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}
editor["kylechui/nvim-surround"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.nvim-surround"),
}

editor["m4xshen/autoclose.nvim"] = {
	enabled = false,
}

return editor
