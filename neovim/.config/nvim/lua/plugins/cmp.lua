return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'fang2hou/blink-copilot',
    'Kaiser-Yang/blink-cmp-avante'
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
      default = { 'avante', 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
      },
      providers = {
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
        },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true
        },
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink"
        }
      }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
