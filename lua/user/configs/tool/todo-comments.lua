local icons = {
	ui = require("modules.utils.icons").get("ui", true),
	diagnostics = require("modules.utils.icons").get("diagnostics", true),
}
return {
	signs = true,
	sign_priority = 8,
	keywords = {
		FIX = {
			icon = icons.ui.Bug,
			color = "error",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
		},
		TODO = { icon = icons.ui.Check, color = "info" },
		HACK = { icon = icons.ui.Fire, color = "warning" },
		WARN = { icon = icons.diagnostics.Warning, color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = icons.ui.Perf, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = icons.ui.Note, color = "hint", alt = { "INFO" } },
		TEST = { icon = icons.diagnostics.Hint, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	gui_style = {
		fg = "NONE",
		bg = "BOLD",
	},
	merge_keywords = true,
	highlight = {
		multiline = true,
		multiline_pattern = "^.",
		multiline_context = 10,
		before = "",
		keyword = "wide",
		after = "fg",
		pattern = [[.*<(KEYWORDS)\s*:]],
		comments_only = true,
		max_line_len = 400,
		exclude = {},
	},
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		test = { "Identifier", "#FF00FF" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		pattern = [[\b(KEYWORDS):]],
	},
}
