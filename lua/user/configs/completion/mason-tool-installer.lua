local core = require("core.settings")
local deps = {}
for _, dep in ipairs(core.lsp_deps) do
  table.insert(deps, dep)
end
for _, dep in ipairs(core.null_ls_deps) do
  table.insert(deps, dep)
end
for _, dep in ipairs(core.dap_deps) do
  table.insert(deps, dep)
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function(event)
		vim.schedule(function()
			if #event.data == 0 then
				print("no changes")
			else
				print("finished")
			end
		end)
	end,
})

return {
    ensure_installed = deps,
	auto_update = false,
	run_on_start = true,
	start_delay = 0,
	-- debounce_hours = 24, -- at least 5 hours between attempts to install/update
      integrations = {
    ['mason-lspconfig'] = true,
    ['mason-null-ls'] = true,
    ['mason-nvim-dap'] = true,
  },
}
