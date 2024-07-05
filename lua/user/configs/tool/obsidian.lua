local M = {}
_G.my_custom_completion = function(arglead, cmdline, cursorpos) -- luacheck: ignore
	local client = require("obsidian").get_client()
	local templates_dir = client:templates_dir()
	if templates_dir == nil then
		error("Templates folder is not defined or does not exist")
	end
	local templates = vim.fn.globpath(templates_dir.filename, "*.md", false, true)
	local result = {}
	for i, file in ipairs(templates) do
		result[i] = require("obsidian.path").new(file).name
	end
	return result
end

M.init = function()
	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.md" },
		callback = function()
			local root_patterns = { ".obsidian" }
			if vim.fs.find(root_patterns, { upward = true })[1] ~= nil then
				vim.opt_local.conceallevel = 1
			end
		end,
	})
end

M.setup = function()
	local obsidian = require("obsidian")
	obsidian.setup({
		mappings = {
			["<leader><leader>p"] = {
				action = function()
					return require("obsidian").img_paste.paste_img()
				end,
				opts = { buffer = true, desc = "obsidian: Paste image from system clipboard" },
			},
		},
		workspaces = {
			{
				name = "memopad",
				path = "~/Documents/memopad",
				overrides = {
					notes_subdir = "inbox",
					daily_notes = {
						folder = "daily",
						template = "daily.md",
					},
					templates = {
						folder = "assets/archetypes",
						substitutions = {
							yesterday = function()
								return os.date("%Y-%m-%d", os.time() - 86400)
							end,
							today = function()
								return os.date("%Y-%m-%d")
							end,
							tomorrow = function()
								return os.date("%Y-%m-%d", os.time() + 86400)
							end,

							day = function()
								return os.date("%d")
							end,
							month = function()
								return os.date("%m")
							end,
							week = function()
								return os.date("%W")
							end,
							weekly = function()
								return os.date("%Y-W%W")
							end,
							weekday = function()
								return os.date("*t").wday
							end,
							weekdayname = function()
								local daysoftheweek =
									{ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
								return daysoftheweek[os.date("*t").wday]
							end,
							year = function()
								return os.date("%Y")
							end,
						},
					},
					disable_frontmatter = true,
					attachments = {
						img_folder = "assets",
					},
					note_id_func = function(title) -- luacheck: ignore
						-- just use unix timestamp for note id
						return tostring(os.time())
					end,
					callbacks = {
						post_setup = function(client)
							require("obsidian-kensaku")(client)
						end,
					},
				},
			},
			--{
			--	name = "no-vault",
			--	path = function()
			--		-- alternatively use the CWD:
			--		-- return assert(vim.fn.getcwd())
			--		return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
			--	end,
			--	overrides = {
			--		notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
			--		new_notes_location = "current_dir",
			--		templates = {
			--			folder = vim.NIL,
			--		},
			--		disable_frontmatter = true,
			--	},
			--},
		},
	})
	-- NOTE: https://github.com/epwalsh/obsidian.nvim/issues/467
	vim.api.nvim_create_user_command("ObsidianNewFromTemplate", function()
		local client = obsidian.get_client()
		local utils = require("obsidian.util")
		-- prevent Obsidian.nvim from injecting it's own frontmatter table
		client.opts.disable_frontmatter = true
		-- prompt for note title
		-- @see: borrowed from obsidian.command.new
		local note
		local title = utils.input("Title: ")
		if not title then
			return
		elseif title == "" then
			title = nil
		end
		local template = vim.fn.input("Template: ", "", "customlist,v:lua.my_custom_completion")
		if template == "" then
			template = "00vault.md"
		end
		note = client:create_note({ title = title, no_write = true })
		if not note then
			return
		end
		-- open new note in a buffer
		client:open_note(note, {
			sync = true,
			callback = function(bufnr)
				-- NOTE: make sure the template folder is configured in Obsidian.nvim opts
				local insert_template = require("obsidian.templates").insert_template
				local util = require("obsidian.util")
				-- HACK: It won't be written to the buffer unless you include an extra line.
				vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { "", "# " .. note.title })
				note = insert_template({
					template_name = template,
					client = client,
					location = util.get_active_window_cursor_location(),
				})
				vim.api.nvim_buf_set_lines(bufnr, 0, 2, false, {})
			end,
		})
		-- hack: delete empty lines before frontmatter; template seems to be injected at line 2
		vim.api.nvim_buf_set_lines(0, 0, 1, false, {})
	end, {})

	-- vim.api.nvim_create_user_command("ObsidianWeekly", function()
	-- 	local client = obsidian.get_client()
	-- 	local utils = require("obsidian.util")
	-- 	client.opts.disable_frontmatter = true
	-- 	local title = client.opts.templates.substitutions.weekly()
	-- 	local template = "weekly.md"
	-- 	local note = client:create_note({ title = title, dir = "weekly", no_write = true })
	-- 	-- open new note in a buffer
	-- 	client:open_note(note, {
	-- 		sync = true,
	-- 		callback = function(bufnr)
	-- 			-- NOTE: make sure the template folder is configured in Obsidian.nvim opts
	-- 			local insert_template = require("obsidian.templates").insert_template
	-- 			local util = require("obsidian.util")
	-- 			-- HACK: It won't be written to the buffer unless you include an extra line.
	-- 			vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { "", "# " .. note.title })
	-- 			note = insert_template({
	-- 				template_name = template,
	-- 				client = client,
	-- 				location = util.get_active_window_cursor_location(),
	-- 			})
	-- 			vim.api.nvim_buf_set_lines(bufnr, 0, 2, false, {})
	-- 		end,
	-- 	})
	-- 	-- hack: delete empty lines before frontmatter; template seems to be injected at line 2
	-- 	vim.api.nvim_buf_set_lines(0, 0, 1, false, {})
	-- end, {})
end

return M
