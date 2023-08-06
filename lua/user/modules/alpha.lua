local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣔⡿⡟⣧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠀⠀⠀⠀ ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢼⣿⣿⣾⣿⣿⣷⠀⣠⣄⣀⡀⠀⠀⠀⠀⠀⣰⣿⠀⠀⠀⠀ ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣿⣇⠀⣰⣾⣶⣶⣿⣿⡄⠀⠀⠀ ]],
	[[⠀⠀⠀⠀⣀⣄⡀⠀⣀⡀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⡆⠀⠀⠀ ]],
	[[⢀⣤⣶⣿⣿⣿⣷⣿⣿⡿⢀⣴⣿⡿⢻⣿⣿⡿⣿⣿⣿⣿⠛⢱⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⠀⠀⠀ ]],
	[[⣿⣦⣽⣿⡉⢹⣿⣿⣧⣶⣿⡿⠋⠀⣼⣿⣿⣿⣿⣿⠟⠁⠂⣿⡿⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀ ]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣤⣶⣿⣿⣿⣿⣿⡟⣡⣿⣿⡄⣿⠁⠠⣿⣿⠏⣿⡿⣿⣿⣿⣿⣿⣄⡀⠀⠀ ]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠘⢹⣿⣿⣷⣷⣶⣾⣦⣿⣀⠀⣿⡿⡀⣿⣇⣹⣿⣹⡇⠘⣿⡇⠀⠀ ]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⣿⠟⠛⠛⠿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣽⣿⣿⣷⡀⠉⠁⠀⠀ ]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢁⡶⠀⠀⠄⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀ ]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⠁⠀⠀⢀⣿⣇⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀ ]],
	[[⣿⠿⠿⠿⠛⠛⠋⠁⠀⠘⣿⠀⠀⠀⠀⢻⣿⣶⣤⣶⣿⣿⣿⣿⣿⣿⣿⠟⠋⠉⠉⠛⠿⠏⠀⠀⠀⠀⠀⠀ ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⢰⣦⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⠄⠀⠀⠀⠀⠀⠀⠀ ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡄⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⠛⠛⠻⠿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⢀⡀⢴ ]],
	[[⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣦⠀⠀⠀⠈⠙⠛⠛⢿⣿⣿⣦⣤⣀⣴⣿⣿⣿⣿⣿⡿⠀⠀⣀⣤⣤⣾⠿⣿⠷ ]],
	[[⠀⠀⠀⢀⣴⣿⣿⡿⠿⣿⣿⣷⠀⣀⠀⠀⣴⠋⢰⣿⣿⣿⣿⡿⢿⡟⢛⣿⣿⣿⠃⠀⣀⡈⠀⠁⠀⠛⠛⠛ ]],
	[[⠀⠀⠀⠁⠀⠀⠀⠀⣼⣿⣿⣿⣷⡸⣷⣮⣿⣴⣿⣿⣿⣿⣿⣧⣠⣷⣿⣿⣿⠋⡀⣰⣿⡧⠀⠀⠀⠀⠀⠀ ]],
	[[⠀⠀⠀⠀⠀⠀⠀⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠿⠹⠿⠿⠛⣿⣿⣟⣥⡞⣴⣿⣿⣿⣶⠀⠀⠀⠀⠀ ]],
}

local function button(sc, txt, leader_txt, keybind, keybind_opts)
	local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl = "AlphaButtons",
		hl_shortcut = "AlphaShortcut",
	}

	if nil == keybind then
		keybind = sc_after
	end
	keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
	opts.keymap = { "n", sc_after, keybind, keybind_opts }

	local function on_press()
		-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
		local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end
local leader = " "
dashboard.section.buttons.val = {
	button("space f n", " File new", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			vim.api.nvim_command("enew")
		end,
	}),
	button("space f p", " Project find", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope").extensions.projects.projects({})
		end,
	}),
	button("space f f", "󰈞 File find", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope.builtin").find_files()
		end,
	}),
	button("space f e", "󰋚 File history", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope.builtin").oldfiles()
		end,
	}),
	button("space f w", " Word find", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope.builtin").live_grep()
		end,
	}),
	button("space f r", " File frecency", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope").extensions.frecency.frecency()
		end,
	}),
	button("space f c", " Scheme change", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope.builtin").colorscheme()
		end,
	}),
}

return {}
