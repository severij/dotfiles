local function toggle_quickfix_list()
    local num_of_windows = vim.fn.winnr('$')
    vim.api.nvim_command('copen')
    vim.api.nvim_command('wincmd J')
    if num_of_windows == vim.fn.winnr('$') then
        vim.api.nvim_command('cclose')
    end
end

-- Convenient mappings for quickfix list
vim.keymap.set('n', '<Space>c', toggle_quickfix_list)
vim.keymap.set('n', '[c', '<Cmd>cprev<CR>')
vim.keymap.set('n', ']c', '<Cmd>cnext<CR>')
