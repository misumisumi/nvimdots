return function()
	-- ポップアップウィンドウを使用しないと変換結果の挿入位置がおかしくなる
	local global = require("core.global")
	local fcitx_config_path = global.home .. "/.local/share/fcitx5/"
	local function file_exists(file)
		local f = io.open(file, "rb")
		if f then
			f:close()
		end
		return f ~= nil
	end
	-- get all lines from a file, returns an empty
	-- list/table if the file does not exist
	local function lines_from(file)
		if not file_exists(file) then
			return {}
		end
		local lines = {}
		for line in io.lines(file) do
			if string.find(line, "server") == nil then
				if string.find(line, "FCITX_CONFIG_DIR") == nil then
					lines[#lines + 1] = vim.split(line, ",", { trimempty = true })[1]:sub(6, -1)
				else
					lines[#lines + 1] = vim.split(line, ",", { trimempty = true })[1]
						:sub(6, -1)
						:gsub("$FCITX_CONFIG_DIR", fcitx_config_path)
				end
			end
		end
		return lines
	end

	local dict_path = fcitx_config_path .. "skk/dictionary_list"
	local opts = {
		eggLikeNewline = true,
		globalDictionaries = lines_from(dict_path),
		immediatelyCancel = false,
		showCandidatesCount = 3,
		skkServerReqEnc = "utf-8",
		skkServerResEnc = "utf-8",
		sources = { "skk_dictionary" "skk_server" },
		usePopup = true,
		userDictionary = global.cache_dir .. "skkeleton",
	}
	vim.fn["skkeleton#config"](opts)
	local keymaps = {
		{ "<C-g>", "", "input" },
		{ "<C-g>", "", "henkan" },
		{ "<C-q>", "", "input" },
		{ "<C-q>", "", "henkan" },
		{ "<C-Space>", "", "input" },
		{ "<C-Space>", "", "henkan" },
		{ "<C-j>", "kakutei", "input" },
		{ "q", "katakana", "input" },
		{ "<C-q>", "hankatakana", "input" },
		{ "<C-x>", "cancel", "henkan" },
		{ "<C-x>", "purgeCandidate", "input" },
		{ "L", "hankatakana", "input" },
	}
	local kanatable = {}
	kanatable["jj"] = "escape"
	kanatable["z "] = { "　" }
	kanatable["z."] = { "．" }
	kanatable["z,"] = { "，" }
	kanatable["z("] = { "（" }
	kanatable["z)"] = { "）" }
	kanatable["z!"] = { "（" }
	kanatable["z1"] = { "１" }
	kanatable["z2"] = { "２" }
	kanatable["z3"] = { "３" }
	kanatable["z4"] = { "４" }
	kanatable["z5"] = { "５" }
	kanatable["z6"] = { "６" }
	kanatable["z7"] = { "７" }
	kanatable["z8"] = { "８" }
	kanatable["z9"] = { "９" }
	kanatable["z0"] = { "０" }

	for _, t in ipairs(keymaps) do
		vim.fn["skkeleton#register_keymap"](t[3], t[1], t[2])
	end
	vim.fn["skkeleton#register_kanatable"]("rom", kanatable)

	vim.api.nvim_create_autocmd("User", {
		pattern = "skkeleton-disable-post",
		callback = function()
			require("cmp").setup.buffer({ enabled = true })
		end,
	})
	vim.api.nvim_create_autocmd("User", {
		pattern = "skkeleton-enable-post",
		callback = function()
			require("cmp").setup.buffer({ enabled = false })
		end,
	})
	-- vim.api.nvim_create_autocmd("User", {
	--     pattern = "skkeleton-mode-changed",
	--     callback = function()
	--         -- vim.notify(vim.inspect(vim.g["skkeleton#mode"]))
	--         if vim.inspect(vim.g["skkeleton#mode"]) ~= "" then
	--             require("cmp").setup.buffer({ enabled = false })
	--         end
	--     end,
	-- })
	vim.api.nvim_create_autocmd("InsertEnter", {
		pattern = "*.tex",
		callback = function()
			local science_kanatable = {}
			science_kanatable["."] = { "．" }
			science_kanatable[","] = { "，" }
			science_kanatable["("] = { "（" }
			science_kanatable[")"] = { "）" }
			science_kanatable["~"] = { "～" }
			vim.fn["skkeleton#register_kanatable"]("rom", science_kanatable)
		end,
	})

	require("skkeleton_indicator").setup({
		alwaysShown = false,
		fadeOutMs = 1000,
	})
end
