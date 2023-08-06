local tool = {}

tool["nvim-neo-tree/neo-tree.nvim"] = {
	lazy = true,
	branch = "v3.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "MunifTanjim/nui.nvim" },
		{ "s1n7ax/nvim-window-picker", config = true },
	},
	cmd = {
		"Neotree",
		"NeoTreeShow",
		"NeoTreeShowToggle",
		"NeoTreeShowInSplit",
		"NeoTreeShowInSplitToggle",
	},
	-- event = "BufReadPost",
	config = require("tool.neo-tree"),
}
tool["tyru/open-browser.vim"] = {
	lazy = true,
	cmd = {
		"OpenBrowser",
		"OpenBrowserSearch",
		"OpenBrowserSmartSearch",
	},
	config = require("tool.open-browser"),
}
tool["vim-skk/skkeleton"] = {
	lazy = true,
	dependencies = {
		{ "vim-denops/denops.vim" },
		{ "delphinus/skkeleton_indicator.nvim" },
	},
	event = "VeryLazy",
	config = require("tool.skkeleton"),
}
tool["voldikss/vim-translator"] = {
	lazy = true,
	cmd = {
		"Translate",
		"TranslateW",
		"TranslateR",
		"TranslateX",
		"TranslateH",
		"TranslateL",
	},
	config = require("tool.vim-translator"),
}
tool["nvim-telescope/telescope.nvim"] = {
	dependencies = {
		{ "sudormrfbin/cheatsheet.nvim", cmd = "Cheatsheet" },
		{ "nvim-lua/popup.nvim" },
		{ "barrett-ruth/telescope-http.nvim" },
		{ "misumisumi/telescope-software-licenses.nvim" },
		{ "LukasPietzschmann/telescope-tabs" },
	},
}
-- Disalbe plugins
tool["nvim-tree/nvim-tree.lua"] = {
	enabled = false,
}
return tool
