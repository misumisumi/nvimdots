return {
	bufs = {
		-- Auto toggle fcitx5
		{ "VimEnter", "* :silent", "!fcitx5-remote -g EN" },
		{ "FocusGained", "* :silent", "!fcitx5-remote -g EN" },
		{ "FocusLost", "* :silent", "!fcitx5-remote -g SKK" },
		{ "VimLeave", "* :silent", "!fcitx5-remote -g SKK" },
	},
}
