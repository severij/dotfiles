local wk = require 'which-key'

local with_jump = function(motion)
  return function()
    local count = vim.v.count
    return (count > 1 and "m'" .. count or '') .. motion
  end
end

vim.keymap.set('n', 'j', with_jump('j'), { expr = true})
vim.keymap.set('n', 'k', with_jump('k'), { expr = true})
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
    ['.'] = { vim.lsp.buf.hover, 'Display hober information about the symbol' }
  },
  ['-'] = { require 'oil'.open, 'Open parent directory' },
  ['['] = {
    c = { '<Cmd>cprev<CR>', 'Previous quickfix error' },
    d = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
    h = { require 'gitsigns'.prev_hunk, 'Previous hunk' }
  },
  [']'] = {
    c = { '<Cmd>cnext<CR>', 'Previous quickfix error' },
    d = { vim.diagnostic.goto_next, 'Next diagnostic' },
    h = { require 'gitsigns'.next_hunk, 'Next hunk' }
  },
  ['<C-c>'] = { '<Cmd>Bwipeout<CR>', 'Delete the current buffer, keep window layout' },
  ['<C-h>'] = { '<C-w>h', 'Move to a window on the left' },
  ['<C-j>'] = { '<C-w>j', 'Move to a window below current one' },
  ['<C-k>'] = { '<C-w>k', 'Move to a window above current one' },
  ['<C-l>'] = { '<C-w>l', 'Move to a window on the right' },
  ['<C-Space>'] = { '<Cmd>ToggleTerm<CR>', 'Toggle terminal'},
  ['<C-S-Space>'] = { '<Cmd>ToggleTermSetName<CR>', 'Toggle terminal'},
  ['<Leader>'] = {
    ['<Leader>'] = { '<Cmd>TermSelect<CR>', 'Select terminal' },
    ['<C-Space>'] = { '<Cmd>ToggleTermSetName<CR>', 'Set name for terminal'},
    ['1'] = { '<Cmd>ToggleTerm 1<CR>', 'Toggle terminal 1'},
    ['2'] = { '<Cmd>ToggleTerm 2<CR>', 'Toggle terminal 2'},
    ['3'] = { '<Cmd>ToggleTerm 3<CR>', 'Toggle terminal 3'},
    ['4'] = { '<Cmd>ToggleTerm 4<CR>', 'Toggle terminal 4'},
    f = {
      name = 'Telescope',
      b = { require 'telescope.builtin'.buffers, 'Buffers' },
      c = { require 'telescope.builtin'.commands, 'Commands' },
      f = { require 'telescope.builtin'.find_files, 'Find files' },
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
      b = { require 'gitsigns'.blame_line, 'Blame line' },
      d = { '<Cmd>DiffviewOpen<CR>', 'Open Diffview' },
      h = { '<Cmd>DiffviewFileHistory %<CR>', 'Open history of the current file in Diffview' },
      g = { require'neogit'.open, 'Open Neogit' },
      s = { require'gitsigns'.stage_hunk, 'Stage hunk at the cursor position' },
      r = { require'gitsigns'.reset_hunk, 'Reset hunk at the cursor position' }
    },
    o = {
      a = { '<Cmd>OverseerQuickAction<CR>', 'Run an action on the most recebt task, or the task under the cursor' },
      A = { '<Cmd>OverseerTaskAction<CR>', 'Select a task to run an action on' },
      b = {
        d = { require'overseer'.delete_task_bundle, 'Delete a saved task bundle'},
        l = { require'overseer'.load_task_bundle, 'Load tasks from a saved bundle'},
        s = { require'overseer'.save_task_bundle, 'Save tasks to a bundle on disk'}
      },
      B = {
        { '<Cmd>OverseerBuild<CR>', 'Open the task builder' }
      },
      g = { require'overseer'.toggle, 'Toggle Overseer task list'},
      o = { '<Cmd>OverseerRun<CR>', 'Run a task from template' },
      O = { '<Cmd>OverseerRunCmd<CR>', 'Run a raw shell command' },
      r = { '<Cmd>OverseerQuickAction restart<CR>', 'Restart previously executed action' },
      f = { '<Cmd>OverseerQuickAction open float<CR>', 'Open in a floating window' },
      h = { '<Cmd>OverseerQuickAction open hsplit<CR>', 'Open in a horizontal split' },
      v = { '<Cmd>OverseerQuickAction open vsplit<CR>', 'Open in a vertical split' },
      t = { '<Cmd>OverseerQuickAction open tab<CR>', 'Open in a tab' }
    }
  }
}, {})

wk.register({
  ['<C-Space>']  = { '<Cmd>ToggleTerm<CR>', 'Toggle terminal' }
}, { mode = 't' })
