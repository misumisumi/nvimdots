vim.g.editorconfig = 0

-- vim.env.WEZTERM_EXECUTABLEに'mux-server'を含んでいるか判定
if vim.env.WEZTERM_EXECUTABLE and vim.env.WEZTERM_EXECUTABLE:find("mux%-server") then
	local function paste()
		return {
			vim.fn.split(vim.fn.getreg(""), "\n"),
			vim.fn.getregtype(""),
		}
	end

	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = paste,
			["*"] = paste,
		},
		cache_enabled = 0,
	}
end

local options = {
	-- Example
	autoindent = true,
	colorcolumn = "80,100",
	fileencodings = "utf-8,sjis,euc-jp,iso-2022-jp",
	exrc = true,
}

return options
