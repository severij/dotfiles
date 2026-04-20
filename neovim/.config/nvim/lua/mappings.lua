local fzf_lua_projects = function()
  local root = os.getenv('HOME') .. '/Projects'

  local cmd = string.format(
    vim.fn.executable('fd') == 1
    and "fd -t d --hidden --no-ignore --glob '.git' '%s' | sed 's|^%s/\\(.*\\)/\\.git/$|\\1|'"
    or "find '%s' -type d -name '.git' -printf '%%h\\n' 2>/dev/null | sed 's|^%s/||'",
    root, root
  )

  require('fzf-lua').fzf_exec(cmd,
    {
      prompt = 'Projects> ',
      actions = {
        ['default'] = function(selected)
          local dir = root .. '/' .. selected[1]
          vim.notify('Opening ' .. dir)
          vim.cmd('tcd ' .. dir)
        end,
      },
    }
  )
end

local diffview_toggle = function()
  local view = require('diffview.lib').get_current_view()
  if view then
    vim.cmd('DiffviewClose')
  else
    vim.cmd('DiffviewOpen')
  end
end

return {
  {'-', require 'oil'.open, desc = 'Open parent directory'},
  {'[h', function() require 'gitsigns'.nav_hunk('prev') end, desc = 'Jump to next hunk'},
  {']h', function() require 'gitsigns'.nav_hunk('next') end, desc = 'Jump to previous hunk'},
  {'<C-c>', '<Cmd>bp<Bar>sp<Bar>bn<Bar>bd<CR>', desc = 'Delete buffer without closing window'},
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
  {'<Leader>gS', require 'gitsigns'.stage_buffer, desc = 'Stage all hunks in the current buffer'},
  {'<Leader>gU', require 'gitsigns'.reset_buffer_index, desc = 'Unstage all hunks for current buffer in the index'},
  {'<Leader>gb', '<Cmd>BlameToggle<CR>', desc = 'Toggle Git blame'},
   {'<Leader>gd', diffview_toggle, desc = 'Toggle Diffview'},
  {'<Leader>gs', require 'gitsigns'.stage_hunk, desc = 'Stage hunk at the cursor position'},
  {'<Leader>gr', require 'gitsigns'.reset_hunk, desc = 'Reset hunk at the cursor position'},
  { -- Terminal
    mode = {'n', 't'},
    {'<C-Tab>', '<Cmd>TermSelect<CR>', desc = 'Select'},
    {'<C-`>', '<Cmd>ToggleTermSetName<CR>', desc = 'Set name'}
  },
  {'<Leader>o', group = 'Options'},
  {'<Leader>ob', function()
    if vim.o.background =='dark' then
      vim.o.background = 'light'
    else
      vim.o.background = 'dark'
    end
  end, desc = 'Toggle background color'}
}
