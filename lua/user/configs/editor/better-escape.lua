return {
	timeout = vim.o.timeoutlen,
	k = function()
		vim.api.nvim_input("<esc>")
		local current_line = vim.api.nvim_get_current_line()
		if current_line:match("^%s+j$") then
			vim.schedule(function()
				vim.api.nvim_set_current_line("")
			end)
		end
	end,
}
