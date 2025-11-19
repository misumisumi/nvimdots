return {
	devpod = {
		binary = "devpod",
		docker_binary = vim.fn.executable("podman") == 1 and "podman" or "docker",
	},
	remote = {
		install_nvim_policy = "relax", -- リモートにneovimがあればダウンロードしない
		upload_config_policy = "relax", -- リモートに設定がなければグローバルにアップロード
		search_binary_pathes = {
			"$HOME/.local/bin",
			"$HOME/.local/share/mise/installs/neovim",
		},
		app_name = "nvim",
		config = {
			base = vim.fn.stdpath("config"),
			dirs = "*",
			compression = {
				enabled = true,
				additional_opts = { "-h" }, -- use hard links when possible
			},
		},
		data = {
			base = vim.fn.stdpath("data"),
			dirs = {},
			compression = {
				enabled = true,
			},
		},
		cache = {
			base = vim.fn.stdpath("cache"),
			dirs = {},
			compression = {
				enabled = true,
			},
		},
		state = {
			base = vim.fn.stdpath("state"),
			dirs = {},
			compression = {
				enabled = true,
			},
		},
	},
	client_callback = function(port, workspace_config)
		local cmd = nil
		if vim.env.TERM == "xterm-kitty" then
			cmd = ("kitty -e nvim --server localhost:%s --remote-ui"):format(port)
		elseif vim.env.TERM_PROGRAM == "WezTerm" then
			cmd = ("wezterm cli set-tab-title --pane-id $(wezterm cli spawn nvim --server localhost:%s --remote-ui) %s"):format(
				port,
				("'Remote: %s'"):format(workspace_config.host)
			)
		end
		if cmd == nil then
			require("remote-nvim.ui").float_term(
				("nvim --server localhost:%s --remote-ui"):format(port),
				function(exit_code)
					if exit_code ~= 0 then
						vim.notify(("Local client failed with exit code %s"):format(exit_code), vim.log.levels.ERROR)
					end
				end
			)
		else
			vim.fn.jobstart(cmd, {
				detach = true,
				on_exit = function(job_id, exit_code, event_type)
					-- This function will be called when the job exits
					print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
				end,
			})
		end
	end,
}
