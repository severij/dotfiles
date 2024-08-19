local wk = require 'which-key'

local with_jump = function(motion)
  return function()
    local count = vim.v.count
    return (count > 1 and "m'" .. count or '') .. motion
  end
end

local toggle_background = function()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end

local toggle_colorcolumn = function()
  if vim.o.colorcolumn == "" then
    vim.o.colorcolumn = "+1"
  else
    vim.o.colorcolumn = ""
  end
end

local toggle_virtualedit = function()
  if vim.o.virtualedit == 'all' then
    vim.o.virtualedit = ''
  else
    vim.o.virtualedit = 'all'
  end
end

local toggle_option = function(option)
  return function() vim.o[option] = not vim.o[option] end
end

local toggle_inlay_hint = function()
  return function() lsp.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end
end

vim.keymap.set('n', 'j', with_jump('j'), { expr = true })
vim.keymap.set('n', 'k', with_jump('k'), { expr = true })
vim.keymap.set('n', '<LeftMouse>', "m'<LeftMouse>")
vim.keymap.set('n', '<RightMouse>', "m'<RightMouse>")

wk.add({
  {'gD', vim.lsp.buf.declaration, desc = 'Goto declaration (LSP)'},
  {'gI', vim.lsp.buf.implementation, desc = 'Goto implementation (LSP)'},
  {'gd', vim.lsp.buf.definition, desc = 'Goto definition (LSP)'},
  {'gr', vim.lsp.buf.references, desc = 'List references to the symbol'},
  {'ya', vim.lsp.buf.code_action, desc = 'Select a code action'},
  {'yf', vim.lsp.buf.format, desc = 'Format the buffer using the attached LSP client'},
  {'yt', vim.lsp.buf.type_definition, desc = 'Jumps to the type definition'},
  {'yr', vim.lsp.buf.rename, desc = 'Rename all references'},
  {'ys', vim.lsp.buf.signature_help, desc = 'Display signature information'},
  {'yo', group = 'Options'},
  {'yob', toggle_background, desc = 'Toggle background'},
  {'yoh', toggle_inlay_hint, desc = 'Toggle inlay hint'},
  {'yov', toggle_virtualedit, desc = 'Toggle virtualedit'},
  {'yow', toggle_option('wrap'), desc = 'Toggle wrap'},
  {'yoc', toggle_colorcolumn, desc = 'Toggle colorcolumn'},
  {'-', require 'oil'.open, desc = 'Open parent directory'},
  {'[', group = 'Jump to previous ...'},
  {'[c', '<Cmd>cprev<CR>', desc = 'quickfix error'},
  {'[h', require 'gitsigns'.prev_hunk, desc = 'hunk'},
  {']', group = 'Jump to next ...'},
  {']c', '<Cmd>cnext<CR>', desc = 'quickfix error'},
  {']h', require 'gitsigns'.next_hunk, desc = 'hunk'},
  {'<C-c>', '<Cmd>Bwipeout<CR>', desc = 'Delete the current buffer, keep window layout' },
  {'<C-h>', '<C-w>h', desc = 'Move to a window on the left' },
  {'<C-j>', '<C-w>j', desc = 'Move to a window below current one' },
  {'<C-k>', '<C-w>k', desc = 'Move to a window above current one' },
  {'<C-l>', '<C-w>l', desc = 'Move to a window on the right' },
  {'<Leader>f', group = 'Find'},
  {'<Leader>fb', require 'telescope.builtin'.buffers, desc = 'Buffers' },
  {'<Leader>fc', require 'telescope.builtin'.commands, desc = 'Commands' },
  {'<Leader>ff', require 'telescope.builtin'.find_files, desc = 'Files in current working directory' },
  {'<Leader>fg', require 'telescope.builtin'.live_grep, desc = 'Live grep' },
  {'<Leader>fh', require 'telescope.builtin'.help_tags, desc = 'Help tags' },
  {'<Leader>fo', require 'telescope.builtin'.oldfiles, desc = 'Previously opened files' },
  {'<Leader>f.', function()
      require 'telescope.builtin'.find_files {
        hidden = true,
        -- Not a very elegant solution but works.
        cwd = vim.fn.fnamemodify(
          vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
          ':p:h:h:h:h'
        )
      }
    end, desc = 'Dotfiles'
  },
  {'<Leader>g', group = 'Git'},
  {'<Leader>gS', require 'gitsigns'.stage_buffer, desc = 'Stage all hunks in the current buffer'},
  {'<Leader>gU', require 'gitsigns'.reset_buffer_index, desc = 'Unstage all hunks for current buffer in the index'},
  {'<Leader>gb', '<Cmd>BlameToggle<CR>', desc = 'Toggle Git blame'},
  {'<Leader>gd', '<Cmd>DiffviewOpen<CR>', desc = 'Open Diffview'},
  {'<Leader>gh', '<Cmd>DiffviewFileHistory %<CR>', desc = 'Open history of the current file in Diffview'},
  {'<Leader>gg', require 'neogit'.open, desc = 'Open Neogit'},
  {'<Leader>gs', require 'gitsigns'.stage_hunk, desc = 'Stage hunk at the cursor position'},
  {'<Leader>gr', require 'gitsigns'.reset_hunk, desc = 'Reset hunk at the cursor position'}
})
