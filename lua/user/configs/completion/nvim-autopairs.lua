return function()
	-- If you want insert `(` after select function or method item
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	local Rule = require("nvim-autopairs.rule")
	local npairs = require("nvim-autopairs")
	npairs.setup({
		disable_filetype = { "TelescopePrompt", "vim" },
	})

	local cond = require("nvim-autopairs.conds")
	npairs.add_rule(Rule("$$", "$$", "tex"))
	npairs.add_rules({
		Rule("$$", "$$", { "tex", "latex", "markdown" }),
		Rule("$", "$", { "tex", "latex", "markdown" })
			-- don't add a pair if the next character is %
			:with_pair(cond.not_after_regex("%%"))
			-- don't move right when repeat character
			:with_move(cond.none())
			-- disable adding a newline when you press <cr>
			:with_cr(cond.none()),
	})
end
