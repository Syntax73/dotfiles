return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      signs        = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      on_attach    = function()
        local gitsigns = require('gitsigns')

        vim.keymap.set('n', '<leader>gb', gitsigns.blame, {})
      end
    })
  end
}
