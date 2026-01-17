local icons = require("utils.icons")
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
		http = {
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {
					schema = {
						model = {
							default = "gpt-5.1-codex-mini",
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
	extensions = {
		mcphub = {
			callback = "mcphub.extensions.codecompanion",
			opts = {
				-- MCP Tools
				make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
				show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
				add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
				show_result_in_chat = true, -- Show tool results directly in chat buffer
				format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
				-- MCP Resources
				make_vars = true, -- Convert MCP resources to #variables for prompts
				-- MCP Prompts
				make_slash_commands = true, -- Add MCP prompts as /slash commands
			},
		},
	},
}
