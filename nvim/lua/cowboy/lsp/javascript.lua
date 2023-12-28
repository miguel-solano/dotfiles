local M = {}
local on_attach = require('cowboy.lsp').on_attach
local capabilities = require('cowboy.lsp').capabilities()

function M.setup()
    require('typescript-tools').setup({
        debug = false,
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            expose_as_code_action = {
                -- 'add_missing_imports',
                -- 'organize_imports',
                -- 'remove_unused',
                -- 'remove_unused_imports',
            },
        },
    })

    -- eslint
    require('lspconfig').eslint.setup({
        settings = {
            validate = 'on',
            codeAction = {
                disableRuleComment = {
                    location = 'separateLine',
                },
                showDocumentation = {
                    enable = true,
                },
            },
        },
        capabilities = capabilities,
        on_attach = on_attach,
    })

end

return M
