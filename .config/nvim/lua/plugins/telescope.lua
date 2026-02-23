return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
      defaults = {
        file_ignore_patterns = {
          ".git",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    telescope.load_extension("ui-select")

    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function switch_to_symbols(prompt_bufnr)
      actions.close(prompt_bufnr)
      builtin.lsp_document_symbols()
    end

    vim.keymap.set("n", "<C-p>", function()
      builtin.find_files({
        attach_mappings = function(_, map)
          map("i", "@", switch_to_symbols)
          return true
        end,
      })
    end)

    -- vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope list buffers" })

    vim.keymap.set("n", "<leader>tgs", builtin.git_status, { desc = "Telescope git status" })
    vim.keymap.set("n", "<leader>tgb", builtin.git_branches, { desc = "Telescope git branch" })
  end,
}
