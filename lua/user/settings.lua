local settings = {}
local function has_binary(name)
	return vim.fn.executable(name) == 1
end

local function get_models()
	if not (has_binary("curl") or has_binary("wget")) then
		return {}
	end

	local cmd
	if has_binary("curl") then
		cmd = { "curl", "-s", "https://opencode.ai/zen/go/v1/models" }
	else
		cmd = { "wget", "-qO-", "https://opencode.ai/zen/go/v1/models" }
	end

	local resp = vim.fn.system(cmd)
	if vim.v.shell_error ~= 0 then
		return {}
	end

	local ok, data = pcall(vim.fn.json_decode, resp)
	if not ok or type(data) ~= "table" or not data.data then
		return {}
	end

	return vim.tbl_map(function(m)
		return m.id
	end, data.data)
end

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
settings["codecompanion_adapter"] = "opencode_http"
settings["ai_adapters"] = {
	opencode_http = {
		type = "openai-compatible",
		name = "Opencode",
		base_url = "https://opencode.ai/zen/go",
		chat_url = "/v1/chat/completions",
		api_key = "cmd:cat ~/.env | grep OPENCODE_API_KEY | cut -d'=' -f2",
		default_model = "deepseek-v4-flash",
		models = get_models(),
		optional = {
			-- Disable thinking for DeepSeek-compatible APIs if needed:
			-- thinking = { type = "disabled" },
		},
	},
}
settings["edit_prediction_source"] = "copilot"

return settings
