local forward_search_tbl = function()
	if require("core.global").is_windows then
		return {
			args = { "-reuse-instance", "%p", "-forward-search", "%f", "%l" },
			executable = require("core.global").home .. "/AppData/Local/SumatraPDF/SumatraPDF.exe",
		}
	else
		return {
			args = { "--synctex-forward", "%l:1:%f", "%p" },
			executable = "zathura",
		}
	end
end
return {
	cmd = { "texlab", "-vv", "--log-file=./texlab.log" },
	filetypes = { "tex", "plaintex", "bib" },
	root_dir = require("lspconfig.util").root_pattern(
		".latexmkrc",
		".latexmkrc.local",
		".texlabroot",
		"texlabroot",
		"Tectonic.toml",
		".git"
	),
	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-g" },
				executable = "latexmk",
				forwardSearchAfter = true,
				onSave = false,
			},
			chktex = {
				onEdit = false,
				onOpenAndSave = true,
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = forward_search_tbl(),
			latexFormatter = "latexindent",
			latexindent = {
				modifyLineBreaks = false,
			},
		},
	},
}
