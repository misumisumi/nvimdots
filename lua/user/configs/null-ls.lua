local null_ls = require("null-ls")
local btns = null_ls.builtins
local sources = {
	btns.diagnostics.statix,
}
local exception_null_ls = require("user.configs.exception-null-ls")
if exception_null_ls.is_nixos() then
	for _, setup in pairs(exception_null_ls.exception) do
		table.insert(sources, setup())
	end
end

return {
	sources = sources,
}
