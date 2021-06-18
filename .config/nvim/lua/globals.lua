homedir = os.getenv('HOME')

function P(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function map(mappings, opts)
  local opts = opts or { noremap = true, silent = true}
  for mode,mode_mappings in pairs(mappings) do
    for lhs,rhs in pairs(mode_mappings) do
      vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
  end
end

function set_options(options)
  for lhs,rhs in pairs(options) do
    vim.opt[lhs] = rhs
  end
end

function set_global_vars(options)
  for lhs,rhs in pairs(options) do
    vim.g[lhs] = rhs
  end
end
