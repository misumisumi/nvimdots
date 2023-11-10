local nvim_lsp = require("lspconfig")
require("completion.mason").setup()
require("completion.mason-lspconfig").setup()

local opts = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
-- Setup lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
local ok, _opts = pcall(require, "user.configs.lsp-servers.nixd")
if not ok then
	_opts = require("completion.servers.nixd")
end
local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
nvim_lsp.nixd.setup(final_opts)
