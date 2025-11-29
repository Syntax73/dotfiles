return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"html",
				"vue",
				"zig",
				"prisma",
				"dart",
			},
			sync_install = false,
			auto_install = false,
			ignore_install = { "all" },
			modules = {},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
