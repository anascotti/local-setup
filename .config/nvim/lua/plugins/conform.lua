return {
    "stevearc/conform.nvim",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
    },
    
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {},
    config = function()
      require("conform").setup {
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_fallback = true }
        end,
        formatters_by_ft = {
          bash = { "shfmt" },
          sh = { "shfmt" },
          lua = { "stylua" },
          go = { "goimports", "gofmt" },
          --javascript = { { "prettierd", "prettier" } },
          --typescript = { { "prettierd", "prettier" } },
          --json = { { "prettierd", "prettier" } },
          --yaml = { { "prettierd", "prettier" } },
          --markdown = { { "prettierd", "prettier" } },
          --graphql = { { "prettierd", "prettier" } },
          },
      }
    end, 
}