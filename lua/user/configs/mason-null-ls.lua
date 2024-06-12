return function()
	local null_ls = require("null-ls")
	local btns = null_ls.builtins
	local exception = require("user.configs.exception")
	local handlers = {
		actionlint = function()
			null_ls.register(btns.diagnostics.actionlint.with({
				condition = function()
					return vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t") == "workflows"
				end,
			}))
		end,
		prettier = function()
			null_ls.register(btns.formatting.prettier.with({
				-- filetypes = { "markdown", "txt", "tex" },
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
						return false
					end
				end,
			}))
		end,
	}
	if not exception.is_nixos() then
		for tool, setups in pairs(exception.null_ls()) do
			handlers[tool] = function()
				for _, setup in pairs(setups) do
					null_ls.register(setup)
				end
			end
		end
    end
	return {
		handlers = handlers,
	}
end
