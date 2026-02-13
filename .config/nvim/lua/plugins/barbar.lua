return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    local barbar = require("barbar")

    barbar.setup({
      sidebar_filetypes = {
        ['neo-tree'] = { event = 'BufWipeout' },
      },
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    })

    local map = vim.keymap
    local opts = { noremap = true, silent = true }

    map.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    map.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
    map.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
    map.set('n', '<A-b>', '<Cmd>BufferPick<CR>', opts)
  end
}
