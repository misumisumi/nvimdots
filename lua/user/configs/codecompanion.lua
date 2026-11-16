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
	},
	adapters = {
		http = {
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {
					schema = {
						model = {
							default = "claude-haiku-4.5",
						},
					},
				})
			end,
			litellm = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://llm.misumi-sumi.com",
						chat_url = "/v1/chat/completions",
						api_key = "cmd:cat ~/.env | grep LITELLM_API_KEY | cut -d'=' -f2",
						cf_client_id = "cmd:cat ~/.env | grep CF_ACCESS_CLIENT_ID | cut -d'=' -f2",
						cf_client_secret = "cmd:cat ~/.env | grep CF_ACCESS_CLIENT_SECRET | cut -d'=' -f2",
					},
					headers = {
						["CF-Access-Client-Id"] = "${cf_client_id}",
						["CF-Access-Client-Secret"] = "${cf_client_secret}",
					},
					schema = {
						model = {
							default = "auto",
						},
					},
				})
			end,
		},
		acp = {
			opencode = function()
				return require("codecompanion.adapters").extend("opencode", {
					defaults = {
						session_config_options = {
							model = "litellm/auto",
						},
					},
				})
			end,
		},
	},
	extensions = {
		history = {
			opts = {
				auto_generate_title = false,
			},
		},
	},
}
