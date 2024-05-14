return {
	cmd = { "typos-lsp" },
	filetypes = { "*" },
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("typos.toml", "_typos.toml", ".typos.toml", "pyproject.toml")(
			fname
		) or vim.fn.getcwd()
	end,
}
