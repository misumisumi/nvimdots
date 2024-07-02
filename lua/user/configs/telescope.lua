require("telescope-tabs").setup({})
require("telescope").load_extension("http")
require("telescope").load_extension("kensaku")
return {
	defaults = {
		mappings = {
			n = {
				["q"] = "close",
			},
		},
	},
}
