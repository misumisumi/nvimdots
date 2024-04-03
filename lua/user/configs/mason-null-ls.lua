local null_ls = require("null-ls")
local btns = null_ls.builtins
local exception_null_ls = require("user.configs.exception-null-ls")
local handlers = {
	actionlint = function()
		null_ls.register(btns.diagnostics.actionlint.with({
			condition = function()
				return vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t") == "workflows"
			end,
		}))
	end,
}

if not exception_null_ls.is_nixos() then
	for k, setup in pairs(exception_null_ls.exception) do
		handlers[k] = null_ls.register(setup())
	end
end

return {
	handlers = function()
		return handlers
	end,
}
