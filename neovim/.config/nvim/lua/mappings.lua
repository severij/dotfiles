local fzf_lua_projects = function()
  local home = os.getenv('HOME')
  
  -- Build a map of project names to full paths
  local projects = {}
  local handle = io.popen(string.format(
    "find '%s/work' '%s/personal' -maxdepth 2 -type d -name '.git' -printf '%%h\\n' 2>/dev/null",
    home, home
  ))
  if handle then
    for line in handle:lines() do
      local name = vim.fn.fnamemodify(line, ':t')
      projects[name] = line
    end
    handle:close()
  end
  
  -- Create list of project names
  local project_names = vim.tbl_keys(projects)
  table.sort(project_names)
  
  require('fzf-lua').fzf_exec(project_names, {
    prompt = 'Projects> ',
    actions = {
      ['default'] = function(selected)
        local name = selected[1]
        local dir = projects[name]
        if dir then
          vim.notify('Opening ' .. dir)
          vim.cmd('tcd ' .. dir)
        end
      end
    }
  })
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
