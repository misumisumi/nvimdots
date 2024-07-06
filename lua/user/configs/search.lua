return {
	collections = {
		pattern = {
			tabs = {
				{
					name = "Kana Search",
					tele_func = function()
						require("telescope").extensions.kensaku.kensaku({})
					end,
				},
			},
		},
	},
}
