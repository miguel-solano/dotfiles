
return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    local utils = require('cowboy.utils')

    local sources = {
      null_ls.builtins.diagnostics.codespell,
      null_ls.builtins.diagnostics.commitlint.with({
        extra_args = { '--config', os.getenv('HOME') .. '/.commitlintrc.js' },
      }),
    }

    if utils.config_exists('.prettierrc') then
      vim.list_extend(sources, { null_ls.builtins.formatting.prettierd })
    end

    if utils.config_exists('.luacheckrc') then
      vim.list_extend(sources, { null_ls.builtins.diagnostics.luacheck })
    end

    if utils.config_exists('selene.toml') then
      vim.list_extend(sources, { null_ls.builtins.diagnostics.selene })
    end

    if utils.config_exists('stylua.toml') then
      vim.list_extend(sources, { null_ls.builtins.formatting.stylua })
    end

    if utils.config_exists('.erb-lint.yml') then
      local diagnostic_source = null_ls.builtins.diagnostics.erb_lint.with({
        command = 'bundle',
        args = vim.list_extend({ 'exec', 'erblint' }, null_ls.builtins.diagnostics.erb_lint._opts.args),
      })

      local formatting_source = null_ls.builtins.formatting.erb_lint.with({
        command = 'bundle',
        args = vim.list_extend({ 'exec', 'erblint' }, null_ls.builtins.formatting.erb_lint._opts.args),
      })

      vim.list_extend(sources, { diagnostic_source, formatting_source })
    end

    null_ls.setup({ sources = sources, on_attach = require('cowboy.lsp').on_attach })
  end,
}
