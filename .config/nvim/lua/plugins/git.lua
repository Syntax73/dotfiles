return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				on_attach = function()
					vim.keymap.set("n", "<leader>gs", ":Git<CR>", {})
					vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
					vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", {})
					vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
					vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", {})
					vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", {})
				end,
			})
		end,
	},
}
