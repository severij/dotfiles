local default_fzf_opts = {'--bind', 'tab:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up'}

local set_options = function(opts)
  local opts = default_fzf_opts
  if arg then
    for _,opt in ipairs(arg) do
      table.insert(opts, opt)
    end
  end
  return opts
end

fzf_buffers = function(opts)
  local spec = vim.fn['fzf#vim#with_preview']{options = set_options(opts)}
  vim.fn['fzf#vim#buffers'](spec)
end

fzf_files = function(path, ...)
  local path = path or '.'
  local spec = vim.fn['fzf#vim#with_preview']{options = set_options(arg)}
  vim.fn['fzf#vim#files'](path, spec)
end

fzf_dotfiles = function(...)
  local spec = vim.fn['fzf#vim#with_preview']{
    source = 'git --git-dir=$HOME/.dotfiles ls-files | xargs -i echo $HOME/{}',
    options = set_options(arg),
    sink = 'e'
  }
  vim.fn['fzf#run'](spec)
end

vim.cmd('command! -nargs=* -complete=dir Files lua fzf_files(<f-args>)<CR>')
vim.cmd('command! -nargs=* -complete=dir Buffers lua fzf_buffers(<f-args>)<CR>')
vim.cmd('command! -nargs=* -complete=dir Dotfiles lua fzf_dotfiles(<f-args>)<CR>')
