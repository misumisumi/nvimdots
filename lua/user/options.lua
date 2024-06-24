vim.g.editorconfig = 0

-- vim.env.WEZTERM_EXECUTABLEに'mux-server'を含んでいるか判定
if vim.env.WEZTERM_EXECUTABLE and vim.env.WEZTERM_EXECUTABLE:find("mux%-server") then
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = require("vim.ui.clipboard.osc52").paste("+"),
			["*"] = require("vim.ui.clipboard.osc52").paste("*"),
		},
		cache_enabled = 0,
	}
end

local options = {
	-- Example
	autoindent = true,
	colorcolumn = "80,100",
	-- fileencodings = "iso-2022-jp,euc-jp,sjis,utf-8",
}

return options
