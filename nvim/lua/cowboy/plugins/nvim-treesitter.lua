return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'RRethy/nvim-treesitter-endwise',
    'andymass/vim-matchup',
    'windwp/nvim-ts-autotag',
  },
  config = function()
    vim.api.nvim_set_hl(0, 'MatchWord', { italic = true })
  end,
}
