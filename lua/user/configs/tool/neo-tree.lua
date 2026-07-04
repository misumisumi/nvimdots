return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
		git = require("modules.utils.icons").get("git"),
	}
	require("neo-tree").setup({
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
		source_selector = {
			winbar = true,
			statusline = false,
		},
		sources = {
			"filesystem",
			"buffers",
			"git_status",
			-- "document_symbols", -- Eary support
		},
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1, -- extra padding on left hand side
				-- indent guides
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				-- expander config, needed for nesting files
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = icons.ui.Folder,
				folder_open = icons.ui.FolderOpen,
				folder_empty = icons.ui.EmptyFolder,
			},
			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					-- Change type
					added = icons.git.Add,
					modified = icons.git.Mod_alt,
					deleted = icons.git.Remove,
					renamed = icons.git.Rename,
					-- Status type
					untracked = icons.git.Untraced,
					ignored = icons.git.Ignore,
					unstaged = icons.git.Unstaged,
					staged = icons.git.Staged,
					conflict = icons.git.Confilict,
				},
			},
		},
		window = {
			position = "left",
			width = 40,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["<space>"] = false,
				["<space><space>"] = {
					"toggle_node",
					nowait = true, -- disable `nowait` if you have existing combos starting with this char that you want to use
				},
				["<2-LeftMouse>"] = "open_drop",
				["<cr>"] = "open_drop",
				["o"] = "open_drop",
				["O"] = "open_with_window_picker",
				["<esc>"] = "revert_preview",
				["P"] = { "toggle_preview", config = { use_float = true } },
				["s"] = "open_split",
				["S"] = "split_with_window_picker",
				["v"] = "open_vsplit",
				["V"] = "vsplit_with_window_picker",
				["t"] = "open_tabnew",
				["C"] = "close_node",
				["Z"] = "expand_all_nodes",
				["z"] = "close_all_nodes",
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				["<"] = "prev_source",
				[">"] = "next_source",
			},
		},
		nesting_rules = {},
		filesystem = {
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = true,
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_hidden = true, -- only works on Windows for hidden files/directories
				hide_by_name = {
					".git",
				},
				hide_by_pattern = {
					"*.meta",
					--"*/src/*/tsconfig.json",
				},
				always_show = {},
				never_show = {
					".DS_Store",
					"__pycache__",
				},
				never_show_by_pattern = {
					--".null-ls_*",
				},
			},
			window = {
				mappings = {
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["H"] = "toggle_hidden",
					["/"] = "fuzzy_finder",
					["D"] = "fuzzy_finder_directory",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
					-- ["Z"] = "expand_all_nodes",
					["n"] = {
						"add",
						-- some commands may take optional config options, see `:h neo-tree-mappings` for details
						config = {
							show_path = "relative",
						},
					},
					["N"] = {
						"add_directory",
						config = {
							show_path = "relative",
						},
					},
					["dd"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					-- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
					["c"] = {
						"copy",
						config = {
							show_path = "relative",
						},
					},
					["m"] = {
						"move",
						config = {
							show_path = "relative",
						},
					},
				},
			},
		},
		buffers = {
			follow_current_file = {
				enable = true,
			},
			group_empty_dirs = true, -- when true, empty folders will be grouped together
			show_unloaded = true,
			window = {
				mappings = {
					["bd"] = "buffer_delete",
					["<bs>"] = "navigate_up",
					["H"] = "navigate_up",
					["."] = "set_root",
				},
			},
		},
		git_status = {
			window = {
				position = "float",
				mappings = {
					["gA"] = "git_add_all",
					["ga"] = "git_add_file",
					["gc"] = "git_commit",
					["gg"] = "git_commit_and_push",
					["gp"] = "git_push",
					["gr"] = "git_revert_file",
					["gu"] = "git_unstage_file",
				},
			},
		},
	})
end
