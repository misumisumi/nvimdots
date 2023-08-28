return {
	cmd = { "nil" },
	filetypes = { "nix" },
	settings = {
		["nil"] = {
			testSetting = 42,
			formatting = {
				command = { "nixpkgs-fmt" },
			},
		},
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.semanticTokensProvider = nil
	end,
}
