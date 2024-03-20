-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = { css = true, javascript = true },
		provideFormatter = false,
	},
	settings = {},
	single_file_support = true,
	flags = { debounce_text_changes = 500 },
}
