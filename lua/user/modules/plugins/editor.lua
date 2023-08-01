local editor = {}

editor["ntpeters/vim-better-whitespace"] = {
	event = "BufWritePre",
	config = require("editor.better-whitespace"),
}
editor["junegunn/vim-easy-align"] = {
	cmd = "EasyAlign",
}
editor["kylechui/nvim-surround"] = {
	event = "InsertEnter",
	config = require("editor.nvim-surround"),
}

return editor
