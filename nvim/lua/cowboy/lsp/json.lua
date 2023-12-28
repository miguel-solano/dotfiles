local M = {}
local lspconfig = require('lspconfig')
local cowboylsp = require('cowboy.lsp')

function M.setup()
    lspconfig.jsonls.setup({
        init_options = {
            provideFormatter = true,
        },
        capabilities = cowboylsp.capabilities(),
        on_attach = cowboylsp.on_attach,
    })
end

return M
