local has_comment, comment = pcall(require, 'Comment')
if has_comment then comment.setup() end

local has_bufdelete, bufdelete = pcall(require, 'bufdelete')
if has_bufdelete then
  vim.keymap.set('n', '<C-c>', '<Cmd>Bwipeout<CR>')  -- Wipeout a buffer.
end
