return function()
	require("modules.utils").load_plugin("autoclose", {
		keys = {
			["("] = { escape = false, close = true, pair = "()" },
			["["] = { escape = false, close = true, pair = "[]" },
			["{"] = { escape = false, close = true, pair = "{}" },

			[">"] = { escape = true, close = false, pair = "<>" },
			[")"] = { escape = true, close = false, pair = "()" },
			["]"] = { escape = true, close = false, pair = "[]" },
			["}"] = { escape = true, close = false, pair = "{}" },

			['"'] = { escape = true, close = true, pair = '""' },
			["'"] = { escape = true, close = true, pair = "''" },
			["`"] = { escape = true, close = true, pair = "``" },
		},
		options = {
			disabled_filetypes = { "big_file_disabled_ft" },
			disable_when_touch = false,
		},
	})
end
