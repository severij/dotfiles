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

wk.register({
  g = {
    D = { vim.lsp.buf.declaration, 'Jump to the declaration' },
    I = { vim.lsp.buf.implementation, 'Jump to the implementation' },
    d = { vim.lsp.buf.definition, 'Jump to the definition' },
    r = { vim.lsp.buf.references, 'List references to the symbol' }
  },
  y = {
    a = { vim.lsp.buf.code_action, 'Select a code action' },
    f = { vim.lsp.buf.format, 'Format the buffer using the attached LSP client' },
    t = { vim.lsp.buf.type_definition, 'Jumps to the type definition' },
    r = { vim.lsp.buf.rename, 'Rename all references' },
    s = { vim.lsp.buf.signature_help, 'Display signature information' },
    o = {
      b = { toggle_background, 'Toggle background' },
      h = { toggle_inlay_hint, 'Toggle inlay hint' },
      v = { toggle_virtualedit, 'Toggle virtualedit' },
      w = { toggle_option('wrap'), 'Toggle wrap' },
      c = { toggle_colorcolumn, 'Toggle colorcolumn' }
    }
  },
  ['-'] = { require 'oil'.open, 'Open parent directory' },
  ['['] = {
    c = { '<Cmd>cprev<CR>', 'Previous quickfix error' },
    h = { require 'gitsigns'.prev_hunk, 'Previous hunk' }
  },
  [']'] = {
    c = { '<Cmd>cnext<CR>', 'Previous quickfix error' },
    h = { require 'gitsigns'.next_hunk, 'Next hunk' }
  },
  ['<C-c>'] = { '<Cmd>Bwipeout<CR>', 'Delete the current buffer, keep window layout' },
  ['<C-h>'] = { '<C-w>h', 'Move to a window on the left' },
  ['<C-j>'] = { '<C-w>j', 'Move to a window below current one' },
  ['<C-k>'] = { '<C-w>k', 'Move to a window above current one' },
  ['<C-l>'] = { '<C-w>l', 'Move to a window on the right' },
  ['<C-Space>'] = { '<Cmd>ToggleTerm<CR>', 'Toggle terminal' },
  ['<C-S-Space>'] = { '<Cmd>ToggleTermSetName<CR>', 'Toggle terminal' },
  ['<Leader>'] = {
    ['<Leader>'] = { '<Cmd>TermSelect<CR>', 'Select terminal' },
    ['<C-Space>'] = { '<Cmd>ToggleTermSetName<CR>', 'Set name for terminal' },
    ['1'] = { '<Cmd>ToggleTerm 1<CR>', 'Toggle terminal 1' },
    ['2'] = { '<Cmd>ToggleTerm 2<CR>', 'Toggle terminal 2' },
    ['3'] = { '<Cmd>ToggleTerm 3<CR>', 'Toggle terminal 3' },
    ['4'] = { '<Cmd>ToggleTerm 4<CR>', 'Toggle terminal 4' },
    f = {
      name = 'Telescope',
      b = { require 'telescope.builtin'.buffers, 'Buffers' },
      c = { require 'telescope.builtin'.commands, 'Commands' },
      f = { require 'telescope.builtin'.find_files, 'Files in current working directory' },
      g = { require 'telescope.builtin'.live_grep, 'Live grep' },
      h = { require 'telescope.builtin'.help_tags, 'Help tags' },
      o = { require 'telescope.builtin'.oldfiles, 'Previously opened files' },
      ['.'] = { function()
        require 'telescope.builtin'.find_files {
          hidden = true,
          -- Not a very elegant solution but works.
          cwd = vim.fn.fnamemodify(
            vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
            ':p:h:h:h:h'
          )
        }
      end, 'Dotfiles' }
    },
    g = {
      name = 'Git',
      S = { require 'gitsigns'.stage_buffer, 'Stage all hunks in the current buffer' },
      U = { require 'gitsigns'.reset_buffer_index, 'Unstage all hunks for current buffer in the index' },
      b = { '<Cmd>BlameToggle<CR>', 'Toggle Git blame' },
      d = { '<Cmd>DiffviewOpen<CR>', 'Open Diffview' },
      h = { '<Cmd>DiffviewFileHistory %<CR>', 'Open history of the current file in Diffview' },
      g = { require 'neogit'.open, 'Open Neogit' },
      s = { require 'gitsigns'.stage_hunk, 'Stage hunk at the cursor position' },
      r = { require 'gitsigns'.reset_hunk, 'Reset hunk at the cursor position' }
    }
  }
}, {})
