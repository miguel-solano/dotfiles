local M = {}

function M.setup()
  -- change border for lsp floats to single
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'single'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

  -- configured servers
  require('cowboy.lsp.ruby').setup()
  require('cowboy.lsp.elixir').setup()
  require('cowboy.lsp.yaml').setup()
  require('cowboy.lsp.json').setup()
  require('cowboy.lsp.tailwind').setup()
  require('cowboy.lsp.javascript').setup()
end

function M.capabilities()
  return require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
end

function M.on_attach(client)
  local function opts(desc)
    return {
      buffer = 0,
      desc = 'LSP: ' .. desc,
    }
  end

  vim.api.nvim_create_user_command('LspFormat', function()
    vim.lsp.buf.format()
  end, { desc = 'LSP: format with language servers' })

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('goto declaration'))
  vim.keymap.set('n', 'gd', '<cmd>Trouble lsp_definitions<cr>', opts('goto definitions'))
  vim.keymap.set('n', 'gi', '<cmd>Trouble lsp_implementations<cr>', opts('goto implementations'))
  vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<cr>', opts('goto references'))
  vim.keymap.set('n', 'gS', vim.lsp.buf.signature_help, opts('signature help'))
  vim.keymap.set('n', 'gd$', vim.lsp.buf.document_symbol, opts('document symbols'))
  vim.keymap.set('n', 'gw$', vim.lsp.buf.workspace_symbol, opts('workspace symbols'))
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts('rename'))
  vim.keymap.set('n', '<leader>D', 'Trouble lsp_type_definitions<cr>', opts('goto type definitions'))

  if client.name == 'rust_analyzer' then
    vim.keymap.set('n', '<F5>', '<cmd>RustDebuggables<cr>', { desc = 'RUST: debug menu' })
    vim.keymap.set(
      { 'n', 'v' },
      '<Leader>ca',
      require('rust-tools').code_action_group.code_action_group,
      opts('code actions')
    )
    vim.keymap.set('n', 'K', require('rust-tools').hover_actions.hover_actions, opts('hover'))
  else
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('hover'))
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts('code actions'))
  end

  if client.name == 'tsserver' then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
end

return M
