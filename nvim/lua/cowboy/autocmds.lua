local M = {}

function M.setup()
    local api = vim.api
    local wamGrp = api.nvim_create_augroup('WamAutocmds', {})

    api.nvim_create_autocmd('FileType', {
        pattern = { 'help', 'startuptime', 'qf', 'lspinfo', 'git' },
        command = 'nnoremap <buffer><silent> q :close<cr>',
        group = wamGrp,
    })
end

return M
