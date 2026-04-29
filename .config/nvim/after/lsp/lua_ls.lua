return {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Optional: stops annoying "Do you want to configure your workpace" popups
      },
      telemetry = {
        enable = false,
      },
    },
  }
}
