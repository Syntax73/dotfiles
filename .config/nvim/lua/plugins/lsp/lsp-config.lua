return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "zls", "ts_ls", "vue_ls", "tailwindcss", "prismals" },
				automatic_enable = true,
			})
		end,
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = function()
					require("mason").setup()
				end,
			},
			{
				"neovim/nvim-lspconfig",
				config = function()
					local severity = vim.diagnostic.severity

					vim.diagnostic.config({
						virtual_text = true,
						underline = {
							severity = { min = severity.WARN },
						},
						signs = {
							text = {
								[severity.ERROR] = " ",
								[severity.WARN] = " ",
								[severity.INFO] = " ",
								[severity.HINT] = "󰌵",
							},
						},
					})

					vim.api.nvim_create_autocmd("LspAttach", {
						callback = function(args)
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							local keymap = vim.keymap
							local buffer = vim.lsp.buf

							if client:supports_method("textDocument/implementation") then
								keymap.set("n", "<leader>cd", buffer.definition, {})
								keymap.set("n", "<leader>crn", buffer.rename, {})
								keymap.set("n", "<leader>cr", buffer.references, {})
								keymap.set("n", "<leader>ci", buffer.implementation, {})
								keymap.set("n", "<leader>c]", buffer.implementation, {})
								keymap.set("n", "<leader>c[", buffer.implementation, {})

								keymap.set("n", "<leader>ca", buffer.code_action, {})
							end
						end,
					})
				end,
			},
		},
	},
}
