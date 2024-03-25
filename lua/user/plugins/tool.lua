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
	},
	-- event = "BufReadPost",
	config = require("user.configs.tool.neo-tree"),
}
tool["tyru/open-browser.vim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("user.configs.tool.open-browser"),
}
tool["vim-skk/skkeleton"] = {
	lazy = true,
	dependencies = {
		{ "vim-denops/denops.vim" },
		{ "delphinus/skkeleton_indicator.nvim" },
	},
	event = "VeryLazy",
	config = require("user.configs.tool.skkeleton"),
}
tool["folke/todo-comments.nvim"] = {
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = require("user.configs.tool.todo-comments"),
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
	config = require("user.configs.tool.vim-translator"),
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

return tool
