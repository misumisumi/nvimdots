local tool = {}
local settings = require("core.settings")

if settings.use_chat then
	local enabled = vim.fn.filereadable(vim.fn.expand("~/.env")) == 1
	tool["olimorris/codecompanion.nvim"] = {
		enabled = enabled,
		dependencies = {
			{
				"ravitemer/codecompanion-history.nvim",
				commit = "eb99d256352144cf3b6a1c45608ec25544a0813d",
			},
			{
				"ravitemer/mcphub.nvim",
				enabled = enabled,
				tag = "v6.2.0",
				dependencies = { "nvim-lua/plenary.nvim" },
				build = function()
					if vim.fn.executable("mcp-hub") == 0 then
						return "npm install -g mcp-hub@latest"
					end
				end,
				config = require("user.configs.tool.mcphub"),
			},
		},
	}
end

tool["misumisumi/remote-nvim.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	branch = "feat/improve-remote-installation",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = require("user.configs.tool.remote-nvim"),
}
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
