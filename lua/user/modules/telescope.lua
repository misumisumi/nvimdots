require("telescope-tabs").setup({})
require("telescope").load_extension("software-licenses")
require("telescope").load_extension("http")
return {
	defaults = {
		mappings = {
			n = {
				["q"] = "close",
			},
		},
	},
}
