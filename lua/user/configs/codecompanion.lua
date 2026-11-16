local icons = { aichat = require("modules.utils.icons").get("aichat", true) }
return {
	opts = {
		language = "Japanese",
	},
	display = {
		chat = {
			window = {
				width = 0.35,
			},
		},
	},
	strategies = {
		chat = {
			adapter = "opencode",
			roles = {
				llm = function(adapter)
					return icons.aichat.Copilot .. " CodeCompanion (" .. adapter.formatted_name .. ")"
				end,
				user = icons.aichat.Me .. " Me",
			},
			keymaps = {
				stop = {
					modes = { n = "<C-q>", i = "<C-q>" },
					description = "Stop",
					callback = function(chat)
						chat:stop()
					end,
				},
			},
		},
		inline = {
			adapter = "opencode_http",
		},
		cmd = {
			adapter = "opencode_http",
		},
	},
	adapters = {
		http = {
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {
					schema = {
						model = {
							default = "gpt-5.1-codex-mini",
							-- default = "gpt-4.1",
						},
					},
				})
			end,
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					env = {
						-- api_key = "cmd:sops decrypt --extract '[\"gemini\"]' ~/.config/codecompanion/api-keys.yaml 2>/dev/null",
						api_key = "cmd:cat ~/.env | grep GEMINI_API_KEY | cut -d'=' -f2",
					},
					schema = {
						model = {
							default = "gemini-2.5-flash",
						},
					},
				})
			end,
		},
		acp = {
			gemini_cli = function()
				return require("codecompanion.adapters").extend("gemini_cli", {
					defaults = {
						auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
					},
					env = {
						GEMINI_API_KEY = "cmd:cat ~/.env | grep GEMINI_API_KEY | cut -d'=' -f2",
					},
				})
			end,
		},
	},
}
