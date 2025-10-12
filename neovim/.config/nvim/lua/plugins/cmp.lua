return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'fang2hou/blink-copilot'
  },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'super-tab' },
    appearance = {
      nerd_font_variant = 'normal'
    },
    completion = {
      menu = { auto_show = true },
      documentation = { auto_show = true }
    },
    sources = {
      default = {
        'lazydev',
        'copilot',
        'lsp',
        'path',
        'snippets',
        'buffer'
      },
      per_filetype = {
        sql = { 'snippets', 'buffer' },
      },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true
        },
        lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 101,
        }
      }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
