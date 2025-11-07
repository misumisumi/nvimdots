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
			window = {
				width = 0.35,
			},
			auto_scroll = true,
			show_header_separator = true,
		},
		diff = function()
			return {
				enabled = true,
				provider = "inline", -- mini_diff|split|inline
				provider_opts = {
					inline = {
						layout = "float", -- float|buffer
					},
				},
				split = {
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split
					opts = {
						"internal",
						"filler",
						"closeoff",
						"algorithm:histogram", -- https://adamj.eu/tech/2024/01/18/git-improve-diff-histogram/
						"indent-heuristic", -- https://blog.k-nut.eu/better-git-diffs
						"followwrap",
						"linematch:120",
					},
				},
			}
		end,
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
							default = "gpt-4.1",
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
