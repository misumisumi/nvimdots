vim.g.editorconfig = 0

local function set_osc52_clipboard()
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

-- vim.env.WEZTERM_EXECUTABLEに'mux-server'を含んでいるか判定
local function check_wezterm_remote_clipboard(callback)
	local wezterm_executable = vim.uv.os_getenv("WEZTERM_EXECUTABLE")

	if wezterm_executable and wezterm_executable:find("wezterm-mux-server", 1, true) then
		callback(true) -- Remote WezTerm session found
	else
		callback(false) -- No remote WezTerm session
	end
end

-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.opt.clipboard:append("unnamedplus")

	-- Standard SSH session handling
	if vim.uv.os_getenv("SSH_CLIENT") ~= nil or vim.uv.os_getenv("SSH_TTY") ~= nil then
		set_osc52_clipboard()
	else
		check_wezterm_remote_clipboard(function(is_remote_wezterm)
			if is_remote_wezterm then
				set_osc52_clipboard()
			end
		end)
	end
end)

local options = {
	-- Example
	autoindent = true,
	colorcolumn = "80,100",
	fileencodings = "utf-8,sjis,euc-jp,iso-2022-jp",
	exrc = true,
}

return options
