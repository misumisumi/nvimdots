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
		{
			texlab = {
				auxDirectory = ".",
				bibtexFormatter = "texlab",
				build = {
					args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
					executable = "latexmk",
					forwardSearchAfter = false,
					onSave = false,
				},
				chktex = {
					onEdit = false,
					onOpenAndSave = false,
				},
				diagnosticsDelay = 300,
				formatterLineLength = 80,
				forwardSearch = {
					args = {},
				},
				latexFormatter = "latexindent",
				latexindent = {
					modifyLineBreaks = false,
				},
			},
		},
	},
}
