return function()
	local function get_hl(name)
		local rgb
		rgb = vim.api.nvim_get_hl_by_name(name, true).foreground

		return string.format("#%06x", rgb)
	end
	require("scrollbar").setup({
		handle = {
			color = get_hl("Comment"),
			text = " ",
			hide_if_all_visible = false,
		},
		marks = {
			Cursor = { priority = 10 },
			Search = { priority = 1 },
			Error = { priority = 2 },
			Warn = { priority = 3 },
			Info = { priority = 4 },
			Hint = { priority = 5 },
			Misc = { priority = 6 },
			GitAdd = { priority = 7 },
			GitChange = { priority = 7 },
			GitDelete = { priority = 7 },
		},
		excluded_filetypes = {
			"prompt",
			"TelescopePrompt",
			"noice",
			"neo-tree",
			"neo-tree-popup",
		},
	})
	require("scrollbar.handlers.gitsigns").setup()
end
