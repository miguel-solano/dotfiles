local utils = require('cowboy.utils')
local lspconfig = require('lspconfig')
local on_attach = require('cowboy.lsp').on_attach
local capabilities = require('cowboy.lsp').capabilities()

local M = {}

function M.setup()
    -- Ruby LSP
    lspconfig.ruby_ls.setup({
        init_options = {
        },
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- Syntax Tree LSP
    lspconfig.syntax_tree.setup({
        cmd = { 'stree', 'lsp' },
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- Rubocop LSP
    lspconfig.rubocop.setup({
        cmd = { 'rubocop', '--lsp' },
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
