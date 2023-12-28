local cowboy = require('cowboy')
local lazy = require('lazy-plugins')

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

lazy.setup()
cowboy.up()
