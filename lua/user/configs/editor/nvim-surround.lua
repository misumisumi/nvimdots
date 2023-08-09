return function()
	require("nvim-surround").setup({
		keymaps = {
			insert = "<C-g>s",
			insert_line = "<C-g>S",
			normal = "ys",
			normal_cur = "yss",
			normal_line = "sA",
			normal_cur_line = "sAA",
			visual = "sa",
			visual_line = "sA",
			delete = "ds",
			change = "cs",
		},
	})
end
