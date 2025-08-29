local fzf_lua_projects = function()
  local path = require'fzf-lua'.path
  require('fzf-lua').files({
    prompt = 'Projects> ',
    cwd = '$HOME',
    fd_opts = "--type d --exec test -e {}/.git \\; --exec echo {} \\; . ~/work ~/personal",
    actions = {
      ['default'] = function(selected)
        local dir = os.getenv('HOME') .. '/' .. path.entry_to_file(selected[1]).path
        -- local dir = vim.fn.fnamemodify(path.entry_to_file(selected[1]).path, ":p")
        vim.notify('Opening ' .. dir)
        vim.cmd('tcd ' .. dir)
      end
    }
  })
end

return {
  {'-', require 'oil'.open, desc = 'Open parent directory'},
  {'[h', function() require 'gitsigns'.nav_hunk('prev') end, desc = 'Jump to next hunk'},
  {']h', function() require 'gitsigns'.nav_hunk('next') end, desc = 'Jump to previous hunk'},
  {'<C-c>', '<Cmd>bp<Bar>sp<Bar>bn<Bar>bd<CR>', desc = 'Delete buffer without closing window'},
  {'<Leader>c', group = 'CodeCompanion'},
  {'<Leader>cc', '<Cmd>CodeCompanionChat toggle<CR>', desc = 'Toggle CodeCompanion chat'},
  {'<Leader>f', group = 'FZF'},
  {'<Leader>f<Space>', require 'fzf-lua'.resume, desc = 'Resume' },
  {'<Leader>fb', require 'fzf-lua'.buffers, desc = 'Open buffers' },
  {'<Leader>ff', require 'fzf-lua'.files, desc = 'Files in CWD' },
  {'<Leader>fp', fzf_lua_projects, desc = 'Projects'},
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
  {'<Leader>h', function()
    require'harpoon':list():add()
    vim.notify('Added current file to Harpoon')
  end},
  {'<Leader><Leader>', function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end},
  {'<Leader>1', function() require'harpoon':list():select(1) end},
  {'<Leader>2', function() require'harpoon':list():select(2) end},
  {'<Leader>3', function() require'harpoon':list():select(3) end},
  {'<Leader>4', function() require'harpoon':list():select(4) end},
  {'<Leader>[', function() require'harpoon':list():prev() end},
  {'<Leader>]', function() require'harpoon':list():next() end},
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
  {'<Leader>d', group = 'Debug'}
}
