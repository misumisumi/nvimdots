local M = {}

M.is_nixos = function()
	return vim.fn.filewritable("/etc/NIXOS")
end

M.null_ls = {
	commitlint = function()
		return require("null-ls.builtins").diagnostics.commitlint.with({
			extra_args = function()
				local utils = require("null-ls.utils").make_conditional_utils()
				if
					utils.root_has_file({
						".commitlintrc",
						".commitlintrc.json",
						".commitlintrc.yaml",
						".commitlintrc.yml",
						".commitlintrc.js",
						".commitlintrc.cjs",
						".commitlintrc.mjs",
						".commitlintrc.ts",
						".commitlintrc.cts",
						"commitlint.config.js",
						"commitlint.config.cjs",
						"commitlint.config.mjs",
						"commitlint.config.ts",
						"commitlint.config.cts",
					})
				then
					return {}
				else
					local home = require("core.global").home
					return {
						"-g",
						home .. "/.config/git/.commitlintrc.json",
					}
				end
			end,
		})
	end,
	textlint = function()
		return require("null-ls.builtins").diagnostics.textlint.with({
			condition = function(utils)
				if
					utils.root_has_file({
						".textlintrc",
						".textlintrc.js",
						".textlintrc.json",
						".textlintrc.yml",
						".textlintrc.yaml",
					})
				then
					vim.api.nvim_create_user_command("TextlintFix", function()
						if vim.fn.executable("textlint") == 1 then
							vim.cmd("silent !textlint --fix %")
						else
							vim.cmd("silent !npx textlint --fix %")
						end
						vim.notify(
							string.format("textlint successfully!"),
							vim.log.levels.INFO,
							{ title = "Format Success" }
						)
					end, {})
					return true
				end
			end,
		})
	end,
}

return M
