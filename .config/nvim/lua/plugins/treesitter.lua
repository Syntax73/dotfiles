return {
	"romus204/tree-sitter-manager.nvim",
	branch = "main",
	-- lazy = false,
	-- build = ":TSUpdate",
	config = function()
		local configs = require("tree-sitter-manager")

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
				"python",
				"elixir",
				"glsl",
			},
			auto_install = false,
			highlight = true,
		})
	end,
}
