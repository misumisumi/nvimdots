local exception = require("user.configs.exception")
local null_ls_deps = {
	"actionlint",
}
if not exception.is_nixos() then
	for k, _ in pairs(exception.null_ls()) do
		table.insert(null_ls_deps, k)
	end
end

local settings = {}

-- Example
settings["use_ssh"] = false
settings["lsp_deps"] = {
	"bashls",
	"jsonls",
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

settings["null_ls_deps"] = null_ls_deps

settings["format_on_save"] = true
settings["format_notify"] = true
settings["format_modifications_only"] = false
settings["format_timeout"] = 5000

return settings
