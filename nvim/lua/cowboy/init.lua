local M = {}
local lsp = require('cowboy.lsp')
local set = require('cowboy.set')
local remap = require('cowboy.remap')
local autocmds = require('cowboy.autocmds')
local usercmds = require('cowboy.usercmds')
local diagnostic = require('cowboy.diagnostic')
local treesitter = require('cowboy.treesitter')

function M.up()
    set.setup()
    remap.setup()
    treesitter.setup()
    autocmds.setup()
    usercmds.setup()
    lsp.setup()
    diagnostic.setup()
end

return M
