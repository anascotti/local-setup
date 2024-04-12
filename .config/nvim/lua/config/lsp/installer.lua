local M = {}



function M.setup(servers, server_options)
    
    require("mason").setup()
    
    require("mason-lspconfig").setup {
      ensure_installed = servers,
    }
end

return M