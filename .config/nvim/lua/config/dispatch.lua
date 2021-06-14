-- Prefer job strategy even when using tmux.
vim.g['dispatch_no_tmux_make'] = true

run_grepprg = function(pattern, path, ...)
  local path = path or '.'
  local args = ""
  for _,arg in ipairs{...} do
    args = args .. ' ' .. arg
  end
  local old_makeprg = vim.o.makeprg
  local old_errorformat = vim.o.errorformat
  vim.o.makeprg = vim.o.grepprg
  vim.o.errorformat = vim.o.grepformat
  vim.api.nvim_command(string.format("Make %s %s%s", pattern, path, args))
  vim.o.makeprg = old_makeprg
  vim.o.errorformat = old_errorformat
end

vim.cmd('command! -nargs=+ -complete=dir Grep lua run_grepprg(<f-args>)<CR>')
