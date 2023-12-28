local M = {}
local lspconfig = require('lspconfig')
local on_attach = require('cowboy.lsp').on_attach
local capabilities = require('cowboy.lsp').capabilities()
local path_to_elixirls = vim.fn.expand("~/.config/nvim/elixir-ls/release/language_server.sh")

function M.setup()
    lspconfig.elixirls.setup({
        cmd = {path_to_elixirls},
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            elixirLS = {
                -- I choose to disable dialyzer for personal reasons, but
                -- I would suggest you also disable it unless you are well
                -- acquainted with dialzyer and know how to use it.
                dialyzerEnabled = false,
                -- I also choose to turn off the auto dep fetching feature.
                -- It often get's into a weird state that requires deleting
                -- the .elixir_ls directory and restarting your editor.
                fetchDeps = false
            }
        }
    })
end

return M
