local settings = {}

-- Example
settings["use_ssh"] = false
settings["lsp_deps"] = {
	"bashls",
	"jsonls",
	"marksman",
	"taplo",
	"terraformls",
	"texlab",
	"typos_lsp",
}
settings["disabled_plugins"] = {
	"m4xshen/autoclose.nvim",
	"nvim-tree/nvim-tree.lua",
	"karb94/neoscroll.nvim",
	"dstein64/nvim-scrollview",
}

settings["treesitter_deps"] = {
	"nix",
	"terraform",
}

settings["null_ls_deps"] = {
	"textlint",
}

return settings
