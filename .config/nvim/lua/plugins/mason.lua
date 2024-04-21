return {
  "williamboman/mason.nvim",
  dependencies = {
  	"williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls",
        "dockerls",
        "gopls",
        "jsonls",
        "pyright",
        "lua_ls",
        "terraformls",
      },
    })

  local mason_tool_installer = require("mason-tool-installer")
  mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters
        "black", -- python formatter
        "isort", -- python formatter
        "prettier",
        "pylint",
        "stylua",
        -- Linter
        "shellcheck",
        "hadolint", -- dockerfile
        "tflint",
        "yamllint",
        -- Go
        "iferr",
        "impl",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "golangci-lint",
        "gotests",

      },
    })

  end,



}
