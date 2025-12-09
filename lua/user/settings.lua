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
	local langs = {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		"jsonc",
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

	vim.api.nvim_create_autocmd("FileType", {
		pattern = langs,
		callback = function(args)
			vim.treesitter.start(args.buf)
		end,
	})
	return langs
end

settings["format_on_save"] = true
settings["format_notify"] = true
settings["format_modifications_only"] = false
settings["format_timeout"] = 5000

settings["use_copilot"] = true
settings["use_chat"] = true
settings["chat_models"] = function()
	return {
		"google/gemini-2.5-flash", -- default
		"google/gemini-2.5-pro",
		"copilot/gpt-4.1",
		"copilot/gpt-5-codex",
		"gemini/default",
		-- free models
		"moonshotai/kimi-k2:free",
		"qwen/qwen3-coder:free",
		"deepseek/deepseek-chat-v3-0324:free",
		"deepseek/deepseek-r1:free",
		"google/gemma-3-27b-it:free",
	}
end

return settings
