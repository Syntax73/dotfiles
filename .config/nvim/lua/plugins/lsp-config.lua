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
        ensure_installed = { "lua_ls", "zls", "ts_ls", "vue_ls", "tailwindcss", "prismals" },
        automatic_enable = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("zls", {
        capabilities = capabilities,
      })

      vim.lsp.config("prismals", {
        capabilities = capabilities,
      })

      -- https://kosu.me/blog/vue-nvim-lsp-config how to config vue lsp
      -- https://kosu.me/blog/breaking-changes-in-mason-2-0-how-i-updated-my-neovim-lsp-config
      local vue_language_server_path = vim.fn.expand("$MASON/packages")
          .. "/vue-language-server"
          .. "/node_modules/@vue/language-server"

      local util = require("lspconfig.util")

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server_path,
              languages = { "javascript", "typescript", "vue" },
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

      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("vue_ls")

      vim.diagnostic.config({
        virtual_text = true,
        underline = {
          severity = { min = vim.diagnostic.severity.WARN },
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵",
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client:supports_method("textDocument/implementation") then
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>crn", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, {})

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
