return {
  {'-', require 'oil'.open, desc = 'Open parent directory'},
  {'[h', require 'gitsigns'.prev_hunk, desc = 'hunk'},
  {']h', require 'gitsigns'.next_hunk, desc = 'hunk'},
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
  {'<Leader>gs', require 'gitsigns'.stage_hunk, desc = 'Stage hunk at the cursor position'},
  {'<Leader>gr', require 'gitsigns'.reset_hunk, desc = 'Reset hunk at the cursor position'}
}
