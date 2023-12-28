local M = {}
local lspconfig = require('lspconfig')
local cowboylsp = require('cowboy.lsp')

function M.setup()
    lspconfig.yamlls.setup({
        capabilities = cowboylsp.capabilities(),
        on_attach = cowboylsp.on_attach,
    })
end

return M
