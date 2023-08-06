local M = {}

---Shortcut for `nvim_replace_termcodes`.
---@param keys string
---@return string
local function termcodes(keys)
	return vim.api.nvim_replace_termcodes(keys, true, true, true)
end

---Returns if two key sequence are equal or not.
---@param a string
---@param b string
---@return boolean
local function keymap_equals(a, b)
	return termcodes(a) == termcodes(b)
end

---Get map
---@param mode string
---@param lhs string
---@return table
local function get_map(mode, lhs)
	for _, map in ipairs(vim.api.nvim_buf_get_keymap(0, mode)) do
		if keymap_equals(map.lhs, lhs) then
			vim.api.nvim_buf_del_keymap(0, mode, lhs)
			return {
				lhs = map.lhs,
				rhs = map.rhs or "",
				expr = map.expr == 1,
				callback = map.callback,
				noremap = map.noremap == 1,
				script = map.script == 1,
				silent = map.silent == 1,
				nowait = map.nowait == 1,
				buffer = true,
			}
		end
	end

	for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
		if keymap_equals(map.lhs, lhs) then
			vim.api.nvim_del_keymap(mode, lhs)
			return {
				lhs = map.lhs,
				rhs = map.rhs or "",
				expr = map.expr == 1,
				callback = map.callback,
				noremap = map.noremap == 1,
				script = map.script == 1,
				silent = map.silent == 1,
				nowait = map.nowait == 1,
				buffer = false,
			}
		end
	end

	return {
		lhs = lhs,
		rhs = lhs,
		expr = false,
		callback = nil,
		noremap = true,
		script = false,
		silent = true,
		nowait = false,
		buffer = false,
	}
end

---Returns the function constructed from the passed keymap object on call of
---which the original keymapping will be executed.
---@param map table keymap object
---@return function
local function get_fallback(map)
	return function()
		local keys, fmode
		if map.expr then
			if map.callback then
				keys = map.callback()
			else
				keys = vim.api.nvim_eval(map.rhs)
			end
		elseif map.callback then
			map.callback()
			return
		else
			keys = map.rhs
		end
		keys = termcodes(keys)
		fmode = map.noremap and "in" or "im"
		vim.api.nvim_feedkeys(keys, fmode, false)
	end
end

---@param mode string
---@param lhs string
---@param rhs function
---@param opts? table
---@param cond? string
local function amend(mode, lhs, rhs, opts, cond)
	local map = get_map(mode, lhs)
	local fallback = get_fallback(map)
	local options = vim.deepcopy(opts) or {}
	if cond ~= "" then
		options.desc = table.concat({
			"[" .. cond,
			(options.desc and ": " .. options.desc or ""),
			"]",
			(map.desc and " / " .. map.desc or ""),
		})
	end
	vim.keymap.set(mode, lhs, function()
		rhs(fallback)
	end, options)
end

---Amend the existing keymap.
---@param mode string | string[]
---@param lhs string
---@param rhs function
---@param opts? table
---@param cond? string
local function modes_amend(mode, lhs, rhs, opts, cond)
	if type(mode) == "table" then
		for _, m in ipairs(mode) do
			amend(m, lhs, rhs, opts, cond)
		end
	else
		amend(mode, lhs, rhs, opts, cond)
	end
end

---@param mode string
---@param lhs string
---@param buf? number
local function unset(mode, lhs, buf)
	print(mode, lhs)
	if buf == nil then
		vim.api.nvim_del_keymap(mode, lhs)
	else
		vim.api.nvim_buf_del_keymap(buf, mode, lhs)
	end
end

---@param mode string | string[]
---@param lhs string
---@param buf? number
local function modes_unset(mode, lhs, buf)
	if type(mode) == "table" then
		for _, m in ipairs(mode) do
			unset(m, lhs, buf)
		end
	else
		unset(mode, lhs, buf)
	end
end

---@param mode string
---@param lhs string
---@param buf? number
local function unset(mode, lhs, buf)
	print(mode, lhs)
	if buf == nil then
		vim.api.nvim_del_keymap(mode, lhs)
	else
		vim.api.nvim_buf_del_keymap(buf, mode, lhs)
	end
end

---@param mode string | string[]
---@param lhs string
---@param buf? number
local function modes_unset(mode, lhs, buf)
	if type(mode) == "table" then
		for _, m in ipairs(mode) do
			unset(m, lhs, buf)
		end
	else
		unset(mode, lhs, buf)
	end
end

---@param mode string
---@param lhs string
---@param buf? number
local function unset(mode, lhs, buf)
	print(mode, lhs)
	if buf == nil then
		vim.api.nvim_del_keymap(mode, lhs)
	else
		vim.api.nvim_buf_del_keymap(buf, mode, lhs)
	end
end

---@param mode string | string[]
---@param lhs string
---@param buf? number
local function modes_unset(mode, lhs, buf)
	if type(mode) == "table" then
		for _, m in ipairs(mode) do
			unset(m, lhs, buf)
		end
	else
		unset(mode, lhs, buf)
	end
end

---@param mapping table<string, map_rhs>
---@param global_flag string
---@param cond? string
function M.amend(mapping, global_flag, cond)
	for key, value in pairs(mapping) do
		local modes, keymap = key:match("([^|]*)|?(.*)")
		cond = cond or ""
		if type(value) == "table" then
			local rhs = value.cmd
			local options = value.options
			modes_amend(cond, vim.split(modes, ""), keymap, function(fallback)
				if _G[global_flag] then
					local fmode = options.noremap and "in" or "im"
					vim.api.nvim_feedkeys(termcodes(rhs), fmode, false)
				else
					fallback()
				end
			end, options)
		elseif value == "" or false then
			modes_unset(vim.split(modes, ""), keymap)
		end
	end
end

return M
