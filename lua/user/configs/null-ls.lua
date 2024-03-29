local null_ls = require("null-ls")
local btns = null_ls.builtins
return {
	sources = {
		btns.diagnostics.statix,
		btns.diagnostics.commitlint.with(function()
			if
				null_ls.utils.root_has_file({
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
					extra_args = { "-g", home .. "/.config/git" .. ".commitlintrc.json" },
				}
			end
		end),
	},
}
