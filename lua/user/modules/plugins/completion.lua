local completion = {}

completion["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.nvim-autopairs"),
}

return completion
