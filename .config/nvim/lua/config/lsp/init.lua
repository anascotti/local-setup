local M = {}

local opts = {}

local lsp_servers = {
    "bashls",
    "dockerls",
    "jsonls",
    "gopls",
    "pyright",
    "lua_ls",
    "terraformls",
}

local tools = {
    -- Linter
    "eslint_d",
    "shellcheck",
    "tflint",
    "yamllint",
    -- Go
    "gofumpt",
    "goimports",
    "gomodifytags",
    "golangci-lint",
    "gotests",
    "iferr",
    "impl",
  }

function M.setup()
   -- Installer
  require("config.lsp.installer").setup(lsp_servers, opts)

end

return M