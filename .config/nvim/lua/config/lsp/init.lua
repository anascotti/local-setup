local M = {}

local opts = {}

local lsp_servers = {
    "bashls",
    "dockerls",
    "gopls",
    "jsonls",
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- for nvim-cmp

function M._attach(client, _)
end


function M.setup()

  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = lsp_servers,
  }

  --local cmp = require('cmp')
  --local cmp_lsp = require("cmp_nvim_lsp")

  --local capabilities = vim.tbl_deep_extend(
    --"force",
    --{},
    --vim.lsp.protocol.make_client_capabilities(),
    --cmp_lsp.default_capabilities())

  local lspconfig = require("lspconfig")

  -- Go
  lspconfig.gopls.setup{
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    single_file_support = true,
    on_attach = M._attach,
    capabilities = M.capabilities,
  }



end

return M