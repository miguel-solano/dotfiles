local M = {}

function M.config_exists(filename)
  local file = vim.fn.getcwd() .. '/' .. filename

  return vim.fn.filereadable(file) == 1
end

function M.is_dir(filename)
  return M.exists(filename) == 'directory'
end

function M.is_file(filename)
  return M.exists(filename) == 'file'
end

function M.exists(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat and stat.type or false
end

return M
