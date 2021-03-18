cmd = vim.cmd
fn = vim.fn

function P(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function opt(scope, key, value)
  local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
  scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function map(mappings, opts)
  local opts = opts or { noremap = true, silent = true}
  for mode,mode_mappings in pairs(mappings) do
    for lhs,rhs in pairs(mode_mappings) do
      vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
  end
end
