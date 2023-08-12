local editor = {}

editor["ntpeters/vim-better-whitespace"] = {
	lazy = true,
	event = "BufWritePre",
	config = require("user.configs.editor.better-whitespace"),
}
editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}
editor["kylechui/nvim-surround"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("user.configs.editor.nvim-surround"),
}

return editor
