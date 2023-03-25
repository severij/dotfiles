local has_dap, dap = pcall(require, 'dap')
if not has_dap then return end

vim.fn.sign_define('DapBreakpoint', {text='●', texthl='red', linehl='', numhl=''})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<Leader>dc', dap.continue, opts)
vim.keymap.set('n', '<Leader>dC', dap.clear_breakpoints, opts)
vim.keymap.set('n', '<Leader>di', dap.step_into, opts)
vim.keymap.set('n', '<Leader>do', dap.step_out, opts)
vim.keymap.set('n', '<Leader>dn', dap.step_over, opts)
vim.keymap.set('n', '<Leader>dq', dap.list_breakpoints, opts)


local has_mason_registry, mason_registry = pcall(require, 'mason-registry')

-- if has_mason_registry then
--   dap.adapters.codelldb = {
--     type = 'server',
--     port = "${port}",
--     executable = {
--       command = require'mason-registry'.get_package('codelldb'):get_install_path() .. '/extension/adapter/codelldb',
--       args = {"--port", "${port}"}
--     }
--   }
-- end

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  }
}
