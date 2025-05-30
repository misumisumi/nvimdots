local M = {}

M.is_nixos = function()
	return vim.fn.filewritable("/etc/NIXOS")
end

M.null_ls = function()
	local null_ls = require("null-ls")
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
				method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				condition = function(utils)
					if utils.has_file({
						".textlintdiable",
						".textlintignore",
					}) then
						return false
					else
						return utils.root_has_file({
							".textlintrc",
							".textlintrc.js",
							".textlintrc.json",
							".textlintrc.yml",
							".textlintrc.yaml",
						})
					end
				end,
			}),
			formatting = btns.formatting.textlint.with({
				filetypes = { "markdown", "txt", "tex" },
				timeout = 15000,
				condition = function(utils)
					if utils.has_file({
						".textlintdiable",
						".textlintignore",
					}) then
						return false
					else
						return utils.root_has_file({
							".textlintrc",
							".textlintrc.js",
							".textlintrc.json",
							".textlintrc.yml",
							".textlintrc.yaml",
						})
					end
				end,
			}),
		},
	}
end

return M
