return {
  {'-', require 'oil'.open, desc = 'Open parent directory'},
  {'[h', require 'gitsigns'.prev_hunk, desc = 'Jump to next hunk'},
  {']h', require 'gitsigns'.next_hunk, desc = 'Jump to previous hunk'},
  {'<Leader>a', group = 'Avante'},
  {'<Leader>f', group = 'FZF'},
  {'<Leader>f<Space>', require 'fzf-lua'.resume, desc = 'Resume' },
  {'<Leader>fb', require 'fzf-lua'.buffers, desc = 'Open buffers' },
  {'<Leader>ff', require 'fzf-lua'.files, desc = 'Files in CWD' },
  {'<Leader>ft', require 'fzf-lua'.tabs, desc = 'Open tabs' },
  {'<Leader>fo', require 'fzf-lua'.oldfiles, desc = 'Opened files history' },
  {'<Leader>fc', require 'fzf-lua'.commands, desc = 'Commands' },
  {'<Leader>fg', require 'fzf-lua'.live_grep_native, desc = 'Live grep' },
  {'<Leader>fh', require 'fzf-lua'.helptags, desc = 'Help tags' },
  {'<Leader>f.', function()
    require 'fzf-lua'.files {
      hidden = true,
      -- Not a very elegant solution but works.
      cwd = vim.fn.fnamemodify(
        vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
        ':p:h:h:h:h'
      )
    }
  end, desc = 'Dotfiles'},
  {'<Leader>g', group = 'Git'},
  {'<Leader>gg', function ()
    require'toggleterm.terminal'.Terminal:new {
      cmd = 'lazygit',
      hidden = true
    }:toggle()
  end, desc = 'Lazygit'},
  {'<Leader>gS', require 'gitsigns'.stage_buffer, desc = 'Stage all hunks in the current buffer'},
  {'<Leader>gU', require 'gitsigns'.reset_buffer_index, desc = 'Unstage all hunks for current buffer in the index'},
  {'<Leader>gb', '<Cmd>BlameToggle<CR>', desc = 'Toggle Git blame'},
  {'<Leader>gd', '<Cmd>DiffviewOpen<CR>', desc = 'Open Diffview'},
  {'<Leader>gs', require 'gitsigns'.stage_hunk, desc = 'Stage hunk at the cursor position'},
  {'<Leader>gr', require 'gitsigns'.reset_hunk, desc = 'Reset hunk at the cursor position'},
  { -- Terminal
    mode = {'n', 't'},
    {'<C-Tab>', '<Cmd>TermSelect<CR>', desc = 'Select'},
    {'<C-`>', '<Cmd>ToggleTermSetName<CR>', desc = 'Set name'}
  },
  {'<Leader>d', group = 'Debug'},
  {'<Leader>D', group = 'Dadbod'},
  {'<Leader>DD', '<Cmd>DBUIToggle<CR>', desc = 'Toggle UI'}
}
