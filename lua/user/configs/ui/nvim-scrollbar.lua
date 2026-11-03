return function()
	local function get_hl(name)
		local rgb = vim.api.nvim_get_hl(0, { name = name, link = false }).fg
		return string.format("#%06x", rgb)
	end

	require("scrollbar").setup({
		providers = {
			gitsigns = true,
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
		exclude = {
			filetypes = {
				["neo-tree"] = true,
				["neo-tree-popup"] = true,
			},
		},
		scrollbar = {
			thumb = {
				text = " ",
				hide_if_all_visible = false,
				highlight = { bg = get_hl("Comment") },
			},
		},
	})
end
