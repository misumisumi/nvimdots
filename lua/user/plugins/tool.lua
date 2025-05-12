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
tool["lambdalisue/kensaku.vim"] = {
	dependencies = { "vim-denops/denops.vim" },
}
tool["epwalsh/obsidian.nvim"] = {
	version = "*",
	lazy = true,
	enabled = require("user.configs.tool.obsidian").enabled,
	ft = { "markdown" },
	cmd = {
		"ObsidianNewFromTemplate",
		"ObsidianCreate",
		"ObsidianKensaku",
		"ObsidianSearch",
		"ObsidianTags",
		"ObsidianDailies",
		"ObsidianNew",
		"ObsidianOpen",
		"ObsidianToday",
		"ObsidianTomorrow",
		"ObsidianYesterday",
		"ObsidianWeekly",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"delphinus/obsidian-kensaku.nvim",
	},
	init = require("user.configs.tool.obsidian").init,
	config = require("user.configs.tool.obsidian").setup,
}
tool["HakonHarnes/img-clip.nvim"] = {
	lazy = true,
	cmd = { "PasteImage" },
}
tool["nvim-telescope/telescope.nvim"] = {
	dependencies = {
		{ "sudormrfbin/cheatsheet.nvim", cmd = "Cheatsheet" },
		{ "nvim-lua/popup.nvim" },
		{ "barrett-ruth/http-codes.nvim" },
		{ "LukasPietzschmann/telescope-tabs" },
		{ "Allianaab2m/telescope-kensaku.nvim", dependencies = { "lambdalisue/kensaku.vim" } },
	},
}

return tool
