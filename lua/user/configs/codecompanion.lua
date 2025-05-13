local icons = {
	aichat = {
		Copilot = "",
		Me = "",
	},
}

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
			adapter = "gemini",
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
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = "cmd:sops decrypt --extract '[\"gemini\"]' ~/.config/codecompanion/api-keys.yaml 2>/dev/null",
				},
				schema = {
					model = {
						-- default = "gemini-2.5-flash-preview-04-17",
						default = "gemini-2.0-flash",
					},
				},
			})
		end,
	},
}
