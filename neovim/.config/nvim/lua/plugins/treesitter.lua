return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
  build = ':TSUpdate',
  config = function()
    local languages = {
      'bash',
      'java',
      'regex',
      'vimdoc',
      'luadoc',
      'vim',
      'lua',
      'markdown',
      'markdown_inline',
      'query',
    }

    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
    }

    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = languages,
      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })
  end
}
