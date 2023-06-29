return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "tsserver",
        "elixirls",
        "rust_analyzer",
        "lua_ls",
        "yamlls",
        "html",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      local mason_null_ls = require "mason-null-ls"
      local null_ls = require "null-ls"
      mason_null_ls.setup {
        ensure_installed = { "prettierd", "eslint_d", "stylua", "eslint-lsp", "rustfmt" },
        handlers = {
          prettierd = function()
            null_ls.register(
              null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } }
            )
          end,
        },
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "elixir" },
      automatic_setup = true,
    },
  },
}
