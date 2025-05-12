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
	cmd = { "texlab" },
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
				-- same to vimtex_lint_chktex_ignore_warnings
				-- -n1: Command terminated with space.
				-- -n3: You should enclose the previous parenthesis with ‘{}’.
				-- -n8: Wrong length of dash may have been used.
				-- -n25: You might wish to put this between a pair of ‘{}’
				-- -n36: Don’t use \/ in front of small punctuation.
				additionalArgs = { "-n1", "-n3", "-n8", "-n25", "-n36" },
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
