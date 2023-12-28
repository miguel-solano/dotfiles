return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = { 'ToggleTerm', 'TermExec' },
  keys = { '<C-Bslash>' },
  config = function()
    require('toggleterm').setup({
      open_mapping = '<c-\\>',
    })

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*',
      callback = function()
        local opts = { buffer = 0 }

        vim.keymap.set('t', '<esc>', '<C-\\><C-n>', opts)
        vim.keymap.set('t', '<C-n>', '<cmd>wincmd h<cr>', opts)
        vim.keymap.set('t', '<C-e>', '<cmd>wincmd j<cr>', opts)
        vim.keymap.set('t', '<C-u>', '<cmd>wincmd k<cr>', opts)
        vim.keymap.set('t', '<C-a>', '<cmd>wincmd l<cr>', opts)
      end,
      group = vim.api.nvim_create_augroup('WamTerminalKeymaps', {}),
    })
  end,
}
