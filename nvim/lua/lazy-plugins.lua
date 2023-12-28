local M = {}

local disabled_plugins = {
    'gzip',
    'matchit',
    'matchparen',
    'netrwPlugin',
    'tarPlugin',
    'tohtml',
    'tutor',
    'zipPlugin',
}

local configuration = {
    performance = {
        rtp = {
            disabled_plugins = disabled_plugins,
        },
    },
}

function M.setup()
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    vim.opt.rtp:prepend(lazypath)
    require('lazy').setup('cowboy.plugins', configuration)
end

return M
