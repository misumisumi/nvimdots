local icons = { aichat = require("modules.utils.icons").get("aichat", true) }

return {
	opts = {
		language = "Japanese",
	},
	display = {
		chat = {
			auto_scroll = false,
			show_header_separator = true,
		},
	},
	strategies = {
		chat = {
			adapter = "copilot",
			roles = {
				llm = function(adapter)
					return icons.aichat.Copilot .. " CodeCompanion (" .. adapter.formatted_name .. ")"
				end,
				user = icons.aichat.Me .. " Me",
			},
		},
		inline = {
			adapter = "copilot",
		},
		cmd = {
			adapter = "copilot",
		},
	},
	adapters = {
		copilot = function()
			return require("codecompanion.adapters").extend("copilot", {
				schema = {
					model = {
						default = "gpt-4o",
					},
				},
			})
		end,
		-- gemini = function()
		-- 	return require("codecompanion.adapters").extend("gemini", {
		--         env = {
		--             api_key = ""
		--         },
		-- 		schema = {
		-- 			model = {
		-- 				default = "gemini-2.5-flash-preview-04-1",
		-- 			},
		-- 		},
		-- 	})
		-- end,
	},
}
