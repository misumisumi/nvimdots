local settings = {}

-- Example
settings["use_ssh"] = true
settings["lsp_deps"] = { "rnix" }
settings["disabled_plugins"] = {
	"m4xshen/autoclose.nvim",
	"nvim-tree/nvim-tree.lua",
	"karb94/neoscroll.nvim",
	"dstein64/nvim-scrollview",
}

return settings
