local settings = {}

-- Example
settings["use_ssh"] = true
settings["lsp_deps"] = {
	"bashls",
	"jsonls",
	"marksman",
	"nil_ls",
	"terraformls",
	"texlab",
}
settings["disabled_plugins"] = {
	"m4xshen/autoclose.nvim",
	"nvim-tree/nvim-tree.lua",
	"karb94/neoscroll.nvim",
	"dstein64/nvim-scrollview",
}

return settings
