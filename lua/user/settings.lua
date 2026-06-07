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

settings["treesitter_deps"] = function()
	return {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"nix",
		"python",
		"rust",
		"terraform",
		"typescript",
		"vimdoc",
		"vue",
		"yaml",
	}
end

settings["format_on_save"] = true
settings["format_notify"] = true
settings["format_modifications_only"] = false
settings["format_timeout"] = 5000

settings["use_copilot"] = true
settings["use_chat"] = true
settings["ai_adapters"] = {}
settings["edit_prediction_source"] = "copilot"

return settings
