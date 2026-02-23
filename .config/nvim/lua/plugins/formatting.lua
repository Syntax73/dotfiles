return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      log_level = vim.log.levels.DEBUG,
      notify_on_error = true,
      formatters_by_ft = {
        javascript = { "oxfmt", "prettier", stop_after_first = true },
        typescript = { "oxfmt", "prettier", stop_after_first = true },
        javascriptreact = { "oxfmt", "prettier", stop_after_first = true },
        typescriptreact = { "oxfmt", "prettier", stop_after_first = true },
        vue = { "oxfmt", "prettier", stop_after_first = true },
        html = { "oxfmt", "prettier", stop_after_first = true },
        css = { "oxfmt", "prettier", stop_after_first = true },
        json = { "oxfmt", "prettier", stop_after_first = true },
        markdown = { "oxfmt", "prettier", stop_after_first = true },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 2000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      conform.format({
        lsp_format = "fallback",
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (VISUAL MODE)" })
  end,
}
