return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "zls", "ts_ls", "volar" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.zls.setup({
				capabilities = capabilities,
			})

			-- https://kosu.me/blog/vue-nvim-lsp-config how to config vue lsp
			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							languages = { "vue" },
						},
					},
				},
				filetypes = {
					"typescript",
					"javascript",
					"javascriptreact",
					"typescriptreact",
					"vue",
				},
			})

			lspconfig.volar.setup({
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					if client:supports_method("textDocument/implementation") then
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
						vim.keymap.set("n", "grn", vim.lsp.buf.rename, {})
						vim.keymap.set("n", "grr", vim.lsp.buf.references, {})
						vim.keymap.set("n", "gri", vim.lsp.buf.implementation, {})

						vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
					end

					if client:supports_method("textDocument/formatting") then
						-- Format the current buffer on save
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end,
	},
}
