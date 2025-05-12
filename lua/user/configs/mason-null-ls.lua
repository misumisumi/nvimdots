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
