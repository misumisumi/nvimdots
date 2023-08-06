local completion = {}

completion["windwp/nvim-autopairs"] = {
	event = "InsertEnter",
	config = require("completion.nvim-autopairs"),
}

return completion
