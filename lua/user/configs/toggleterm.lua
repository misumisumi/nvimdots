return {
	on_open = function(term)
		vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
		vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
	end,
}
