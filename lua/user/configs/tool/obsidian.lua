local M = {}
M.enabled = function()
	-- パスを変えたらgithub workflowのパスも変更すること
	return vim.fn.isdirectory(vim.fn.expand("~/Documents/memopad")) == 1
end

M.setup = {
	legacy_commands = false,
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
				frontmatter = {
					enabled = true,
				},
				attachments = {
					folder = "assets",
				},
				ui = {
					enable = false,
				},
				note_id_func = function(title) -- luacheck: ignore
					-- just use unix timestamp for note id
					return tostring(os.time())
				end,
				callbacks = {
					enter_note = function(note)
						vim.keymap.set("n", "<leader>tch", "<cmd>Obsidian toggle_checkbox<cr>", {
							buffer = true,
							desc = "Toggle checkbox",
						})
					end,
					post_setup = function()
						require("obsidian-kensaku").setup({})
					end,
				},
			},
		},
	},
}

return M
