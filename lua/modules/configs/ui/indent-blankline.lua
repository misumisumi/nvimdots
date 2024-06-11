return function()
	require("modules.utils").load_plugin("ibl", {
		enabled = true,
		debounce = 200,
		indent = {
			char = "│",
			tab_char = "│",
			smart_indent_cap = true,
			priority = 2,
		},
		whitespace = { remove_blankline_trail = true },
		-- Note: The `scope` field requires treesitter to be set up
		scope = {
			enabled = true,
			char = "┃",
			show_start = false,
			show_end = false,
			injected_languages = true,
			priority = 1000,
			include = {
				node_type = {
					["*"] = {
						"argument_list",
						"arguments",
						"assignment_statement",
						"Block",
						"class",
						"ContainerDecl",
						"dictionary",
						"do_block",
						"do_statement",
						"element",
						"except",
						"FnCallArguments",
						"for",
						"for_statement",
						"function",
						"function_declaration",
						"function_definition",
						"if_statement",
						"IfExpr",
						"IfStatement",
						"import",
						"InitList",
						"list_literal",
						"method",
						"object",
						"ParamDeclList",
						"repeat_statement",
						"selector",
						"SwitchExpr",
						"table",
						"table_constructor",
						"try",
						"tuple",
						"type",
						"var",
						"while",
						"while_statement",
						"with",
					},
				},
			},
		},
		exclude = {
			buftypes = {
				"help",
				"nofile",
				"prompt",
				"quickfix",
				"terminal",
			},
			filetypes = {
				"", -- for all buffers without a file type
				"alpha",
				"bigfile",
				"checkhealth",
				"dap-repl",
				"diff",
				"fugitive",
				"fugitiveblame",
				"git",
				"gitcommit",
				"help",
				"log",
				"markdown",
				"notify",
				"NvimTree",
				"Outline",
				"qf",
				"TelescopePrompt",
				"text",
				"toggleterm",
				"undotree",
				"vimwiki",
			},
		},
	})
end
