local M = {}
M.enabled = function()
	-- パスを変えたらgithub workflowのパスも変更すること
	return vim.fn.isdirectory(vim.fn.expand("~/Documents/memopad")) == 1
end

M.setup = {
	mappings = {
		["<leader><leader>p"] = {
			action = function()
				return require("obsidian").img_paste.paste_img()
			end,
			opts = { buffer = true, desc = "obsidian: Paste image from system clipboard" },
		},
		["<leader>tch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
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
				ui = {
					enable = false,
				},
				note_id_func = function(title) -- luacheck: ignore
					-- just use unix timestamp for note id
					return tostring(os.time())
				end,
				callbacks = {
					post_setup = function(client)
						require("obsidian-kensaku")(client)
						-- NOTE: https://github.com/epwalsh/obsidian.nvim/issues/467
						vim.api.nvim_create_user_command("ObsidianCreate", function()
							-- local client = require("obsidian").get_client()
							local utils = require("obsidian.util")
							-- prevent Obsidian.nvim from injecting it's own frontmatter table
							client.opts.disable_frontmatter = true
							-- prompt for note title
							-- @see: borrowed from obsidian.command.new
							local title = utils.input("Title: ")
							if not title then
								return
							elseif title == "" then
								title = nil
							end
							local picker = client:picker()
							local note = client:create_note({ title = title, no_write = true })
							local buf = 0
							client:open_note(note, {
								sync = true,
								callback = function(bufnr)
									buf = bufnr
								end,
							})
							local insert_template = require("obsidian.templates").insert_template
							local util = require("obsidian.util")
							picker:find_templates({
								callback = function(template)
									-- HACK: It won't be written to the buffer unless you include an extra line.
									vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "", "# " .. note.title })
									note = insert_template({
										template_name = template,
										client = client,
										location = util.get_active_window_cursor_location(),
									})
									vim.api.nvim_buf_set_lines(buf, 0, 2, false, {})
								end,
							})
						end, {})
						vim.api.nvim_create_user_command("ObsidianSearchAsset", function()
							local picker = client:picker()
							local selection_mappings = picker:_note_selection_mappings()
							function picker._build_find_cmd(self)
								local search = require("obsidian.search")
								local search_opts = search.SearchOpts.from_tbl({
									sort_by = self.client.opts.sort_by,
									sort_reversed = self.client.opts.sort_reversed,
									include_non_markdown = true,
									exclude = { "archetypes" },
								})
								return search.build_find_cmd(".", "/", search_opts)
							end
							picker:find_files({
								prompt_title = "Assets",
								dir = picker.client:vault_root():joinpath("assets"),
								selection_mappings = selection_mappings,
							})
						end, {})
					end,
				},
			},
		},
	},
}

return M
