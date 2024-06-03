return function()
	local null_ls = require("null-ls")
	local btns = null_ls.builtins
	local sources = {
		btns.diagnostics.statix,
	}
	local exception = require("user.configs.exception")
	if exception.is_nixos() then
		for _, setups in pairs(exception.null_ls()) do
			for _, setup in pairs(setups) do
				table.insert(sources, setup)
			end
		end
	end
	return {
		sources = sources,
		debug = true,
	}
end
