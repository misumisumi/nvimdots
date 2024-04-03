local exception_null_ls = require("user.configs.exception-null-ls")
local null_ls_deps = {
	"actionlint",
}
if not exception_null_ls.is_nixos() then
	for k, _ in pairs(exception_null_ls.exception) do
		table.insert(null_ls_deps, k)
	end
end

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

settings["null_ls_deps"] = null_ls_deps

return settings
