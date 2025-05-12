local uv = vim.loop
return function()
	local path = require("core.global").cache_dir .. "undotree"
	if vim.fn.has("persistent_undo") then
		uv.fs_mkdir(path, 755, function()
			assert(true, ("Failed to mkdir %s!"):format(path))
		end)
	end
	vim.g.undofile = path
	vim.g.undotree_WindowLayout = 3 -- LeftSideWindow
end
