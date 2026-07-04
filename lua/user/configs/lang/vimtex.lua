return function()
	if require("core.global").is_windows then
		vim.g.view_general_viewer = "SumatraPDF"
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
	else
		vim.g.vimtex_view_method = "zathura"
	end

	vim.g.vimtex_complete_enabled = 0
	vim.g.vimtex_quickfix_open_on_warning = 0
	vim.g.vimtex_compiler_progname = "nvr"
	vim.g.tex_flavor = "latex"

	vim.g.vimtex_fold_enabled = 1
	vim.g.vimtex_fold_types = {
		items = {
			enabled = 0,
		},
		envs = {
			blacklist = { "figure", "itemize", "tabular", "tikzpicture", "subsection", "subsubsection" },
		},
	}
	vim.g.maplocalleader = ","
end
