local definitions = {
	-- Example
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
	},
}
local fcitx5 = {
	-- Auto toggle fcitx5
	{ "VimEnter", "* :silent", "!fcitx5-remote -g EN" },
	{ "FocusGained", "* :silent", "!fcitx5-remote -g EN" },
	{ "FocusLost", "* :silent", "!fcitx5-remote -g SKK" },
	{ "VimLeave", "* :silent", "!fcitx5-remote -g SKK" },
}
if require("core.global").is_linux then
	for k, v in pairs(fcitx5) do
		definitions.bufs[k] = v
	end
end

return definitions
