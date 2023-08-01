return function()
	local viewer = "zathura"
	vim.g.vimtex_view_method = viewer
	vim.g.vimtex_view_general_viewer = viewer
	vim.g.vimtex_view_general_options = '-x "nvr +%{line} %{input}" --synctex-forward @line:0:@tex @pdf'
	vim.g.vimtex_view_forward_search_on_start = false
	vim.g.vimtex_syntax_enabled = 0
	vim.g.vimtex_complete_enabled = 0
	vim.g.vimtex_format_enabled = 0
	vim.g.vimtex_format_enabled = 0
	vim.g.vimtex_lint_chktex_parameters = "-n"
	vim.g.vimtex_quickfix_open_on_warning = 0

	vim.g.vimtex_fold_enabled = 1
	vim.g.vimtex_fold_types = {
		items = {
			enabled = 0,
		},
		envs = {
			blacklist = { "figure", "itemize", "tabular", "tikzpicture", "subsection", "subsubsection" },
		},
	}
end
