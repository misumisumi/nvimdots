local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

return {
	-- Remove default keymap
	["n|<leader>nr"] = "",

	-- Plugin: Neotree
	["n|<leader>e"] = map_cr("Neotree toggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),
	-- Plugin: open-browser
	["n|<leader>bo"] = map_cmd("<Plug>(openbrowser-smart-search)")
		:with_noremap()
		:with_silent()
		:with_desc("Openbrowser: Search"),
	-- Plugin: skkeleton
	["i|<C-Space>"] = map_cmd("<Plug>(skkeleton-toggle)"):with_silent(),
	["c|<C-Space>"] = map_cmd("<Plug>(skkeleton-toggle)"):with_silent(),
	-- Plugin: todo-comments
	["n|<leader>tt"] = map_cr("TodoQuickFix"):with_noremap():with_silent():with_desc("tool: Toggle Todos in project"),
	["n|<leader>ft"] = map_cr("TodoTelescope"):with_noremap():with_silent():with_desc("find: Todos in project"),
	["n|]t"] = map_callback(function()
			require("todo-comments").jump_next()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Next todo comment"),
	["n|[t"] = map_callback(function()
			require("todo-comments").jump_prev()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Prev todo comment"),
	-- Plugin: telescope
	["n|<leader>fl"] = map_cr("Telescope diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	["n|<leader><S-cr>"] = map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	-- Plugin: vim-fugitive
	["n|g"] = "",
	["n|gps"] = "",
	["n|gpl"] = "",
	["n|<leader>ga"] = map_cr("Git add %"):with_noremap():with_silent():with_desc("git: Add"),
	["n|<leader>gc"] = map_cr("Git commit"):with_noremap():with_silent():with_desc("git: Commit"),
	["n|<leader>gd"] = map_cr("Gdiffsplit"):with_noremap():with_silent():with_desc("git: DiffSplit"),
	["n|<leader>gps"] = map_cr("Git push"):with_noremap():with_silent():with_desc("Git Push"),
	["n|<leader>gpl"] = map_cr("Git pull"):with_noremap():with_silent():with_desc("git: Pull"),
	["n|<leader>gl"] = map_callback(function()
			_toggle_lazygit()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: Toggle lazygit"),
	["t|<leader>gl"] = map_callback(function()
			_toggle_lazygit()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: Toggle lazygit"),
	-- Plugin: vim-translator
	["v|<leader>tw"] = map_cr("TranslateW"):with_noremap():with_silent():with_desc("Translator: show window"),
	["v|<leader>tx"] = map_cr("TranslateX"):with_noremap():with_silent():with_desc("Translator: copy clipboard"),
	["n|<leader><leader>p"] = map_cr("PasteImage"):with_noremap():with_desc("Paste image from system clipboard"),
}
