-- lsp.lua
local M = {}

function M.setup()
    -- Configura Mason
    require("mason").setup()
    
    -- Configura Mason-LSPconfig per installare automaticamente i server LSP
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", }, -- Specifica i server che vuoi installare
    })
    
    -- Configura ogni server LSP
    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers({
        function(server_name)
            lspconfig[server_name].setup {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            }
        end,
    })
end

return M
