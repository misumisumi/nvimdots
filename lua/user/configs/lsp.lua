require("completion.neoconf").setup()
require("completion.mason-lspconfig").setup()

local opts = {
	capabilities = require("modules.utils").get_lsp_capabilities(),
}
if vim.fn.executable("nixd") == 1 then
	local ok, _opts = pcall(require, "user.configs.lsp-servers.nixd")
	if not ok then
		_opts = require("completion.servers.nixd")
	end
	local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
	require("modules.utils").register_server("nixd", final_opts)
end
