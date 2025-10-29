local settings = {}

-- Example
settings["use_ssh"] = false
settings["colorscheme"] = "tokyonight-moon"
settings["lsp_deps"] = {
	"bashls",
	"jsonls",
	"taplo",
	"tofu_ls",
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

settings["format_on_save"] = true
settings["format_notify"] = true
settings["format_modifications_only"] = false
settings["format_timeout"] = 5000

settings["use_copilot"] = true
settings["use_chat"] = true

return settings
