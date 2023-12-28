local M = {}

function M.setup()
    vim.g.mapleader = ' '
    vim.opt.guicursor = ''

    vim.opt.nu = true
    vim.opt.relativenumber = true

    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    vim.opt.smartindent = true

    vim.opt.swapfile = false
    vim.opt.backup = false

    vim.opt.hlsearch = false
    vim.opt.incsearch = true

    vim.opt.termguicolors = true

    vim.opt.scrolloff = 8
    vim.opt.signcolumn = 'yes'

    vim.opt.updatetime = 50
    vim.opt.colorcolumn = '80'

    vim.cmd.colorscheme 'gruvbox'

    if vim.fn.executable('rg') == 1 then
        vim.opt.grepprg = 'rg -H --no-heading --vimgrep'
        vim.opt.grepformat = '%f:%l:%c:%m,%f'
        vim.g.ackprg = 'rg --vimgrep'
    end
end

return M
