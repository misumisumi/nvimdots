local trouble_filter = function(position)
	return function(_, win)
		return vim.w[win].trouble
			and vim.w[win].trouble.position == position
			and vim.w[win].trouble.type == "split"
			and vim.w[win].trouble.relative == "editor"
			and not vim.w[win].trouble_preview
	end
end
return {
	left = function()
		return {
			{
				ft = "neo-tree",
				pinned = true,
				collapsed = false,
				size = { height = 0.6, width = 40 },
				open = "Neotree toggle position=left",
			},
			{
				ft = "trouble",
				pinned = true,
				collapsed = false,
				size = { height = 0.4, width = 40 },
				open = function()
					if vim.b.buftype == "" then
						return "Trouble symbols toggle win.position=right"
					end
				end,
				filter = trouble_filter("right"),
			},
		}
	end,
}
