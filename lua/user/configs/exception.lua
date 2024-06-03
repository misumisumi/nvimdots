local M = {}

M.is_nixos = function()
	return vim.fn.filewritable("/etc/NIXOS")
end

M.null_ls = function()
	local btns = require("null-ls.builtins")
	return {
		commitlint = {
			diagnostics = btns.diagnostics.commitlint.with({
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
			}),
		},
		textlint = {
			diagnostics = btns.diagnostics.textlint.with({
				filetypes = { "markdown", "txt", "tex" },
				timeout = 15000,
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
					vim.cmd("silent !node_modules/.bin/textlint --fix %")
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
			}),
		},
	}
end

return M
