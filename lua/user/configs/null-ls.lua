local null_ls = require("null-ls")
local btns = null_ls.builtins
return {
	sources = {
		btns.diagnostics.statix,
		btns.diagnostics.commitlint.with({
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
}
