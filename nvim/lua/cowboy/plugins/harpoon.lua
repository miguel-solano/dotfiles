return {
  'ThePrimeagen/harpoon',
  keys = { '<Leader>h', '<C-e>' },
  config = function()
    local function opts(desc)
      return {
        desc = 'HARPOON: ' .. desc,
      }
    end

    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>h', mark.add_file, opts('mark file'))
    vim.keymap.set('n', '<C-e>', function()
      require('harpoon.ui').toggle_quick_menu()
    end, opts('toggle UI'))

    vim.keymap.set('n', '<M-r>1', function()
      ui.nav_file(1)
    end, opts('goto file 1'))
    vim.keymap.set('n', '<M-r>2', function()
      ui.nav_file(2)
    end, opts('goto file 2'))
    vim.keymap.set('n', '<M-r>3', function()
      ui.nav_file(3)
    end, opts('goto file 3'))
    vim.keymap.set('n', '<M-r>4', function()
      ui.nav_file(4)
    end, opts('goto file 4'))
  end,
}
