local completion = {}

completion["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("user.configs.completion.nvim-autopairs"),
}

return completion
