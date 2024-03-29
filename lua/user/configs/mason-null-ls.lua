local null_ls = require("null-ls")
local btns = null_ls.builtins
return {
	handlers = function()
		return {
			textlint = function()
				null_ls.register(btns.diagnostics.textlint.with({
					condition = function(utils)
						return utils.root_has_file({ ".textlintformat" })
					end,
				}))
				-- disable textlint formatting but keep the command
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
			end,
		}
	end,
}
