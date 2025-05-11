-- lsp.lua
local M = {}

function M.setup()
    -- Configura Mason
    require("mason").setup()

    -- Configura Mason-LSPconfig per installare automaticamente i server LSP
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "pyright", "jsonls" },
    })

    -- Configura manualmente ogni server LSP
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end
end

return M
