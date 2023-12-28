local M = {}

function M.setup()
  local function opts(prefix, desc)
    return {
      desc = prefix .. ': ' .. desc,
    }
  end

  -- nvim-tree
  vim.keymap.set('n', '<C-t>', '<cmd>NvimTreeToggle<cr>', opts('FILES', 'toggle file tree'))
  -- sort.nvim
  vim.keymap.set('n', 'gs', '<cmd>Sort<cr>', { desc = 'SORT: sort line(s)' })
  vim.keymap.set('x', 'gs', '<esc><cmd>Sort<cr>', { desc = 'SORT: sort visual selection' })
  -- toggleterm
  vim.keymap.set('n', '<C-Bslash>', '<cmd>ToggleTerm<cr>', opts('TOGGLETERM', 'toggle terminal'))
  -- trouble
  vim.keymap.set('n', '<leader>t', '<cmd>TroubleToggle<cr>', opts('TROUBLE', 'toggle window'))
  -- vim-easy-align
  vim.keymap.set({ 'n', 'x' }, 'ga', '<Plug>(EasyAlign)<cr>', opts('VIM-EASY-ALIGN', 'align'))
  -- vim-test
  vim.keymap.set('n', 't<C-n>', '<cmd>TestNearest<cr>', opts('VIM-TEST', 'test nearest'))
  vim.keymap.set('n', 't<C-f>', '<cmd>TestFile<cr>', opts('VIM-TEST', 'file'))
  vim.keymap.set('n', 't<C-a>', '<cmd>TestSuite<cr>', opts('VIM-TEST', 'suite'))
  vim.keymap.set('n', 't<C-l>', '<cmd>TestLast<cr>', opts('VIM-TEST', 'last'))
  -- Misc
  vim.keymap.set({ 'n', 'v' }, '<Leader>c', '"+y', opts('CLIPBOARD', 'copy to system'))
  vim.keymap.set({ 'n' }, 'zm', ':foldclose<CR>', {})
  vim.keymap.set({ 'n' }, 'zr', ':foldopen<CR>', {})
  -- Bufferline
  vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'BUFFERLINE: next' })
  vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'BUFFERLINE: previous' })
end

return M
