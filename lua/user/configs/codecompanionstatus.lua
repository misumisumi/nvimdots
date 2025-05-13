local M = require("lualine.component"):extend()

---@type boolean | nil
M.processing = false
M.spinner_index = 1
local icons = {
	cmp = require("modules.utils.icons").get("cmp", true),
	ui = require("modules.utils.icons").get("ui", true),
}
local default_options = {
	icon = icons.cmp.Copilot_alt,
	symbols = {
		-- Use standard unicode characters for the spinner and done symbols:
		spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
	},
}

-- Initializer
function M:init(options)
	M.super.init(self, options)
	-- Apply default options.
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)

	-- Apply symbols.
	self.symbols = self.options.symbols or {}
	self.symbols.spinners_len = #self.symbols.spinners or 0

	local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "CodeCompanionRequest*",
		group = group,
		callback = function(request)
			if request.match == "CodeCompanionRequestStarted" then
				self.processing = true
			elseif request.match == "CodeCompanionRequestFinished" then
				self.processing = false
			end
		end,
	})
end

-- Function that runs every time statusline is updated
function M:update_status()
	local msg = " "
	if self.processing then
		self.spinner_index = (self.spinner_index % self.symbols.spinners_len) + 1
		msg = self.symbols.spinners[self.spinner_index]
	end
	return msg
end

return M
