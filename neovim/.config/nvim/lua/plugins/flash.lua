return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  config = function ()
    require'flash'.setup()
    require'flash'.toggle()
    vim.api.nvim_set_hl(0, 'FlashLabel', {
      bold = true,
      bg = '#ff0000',
      fg = '#ffffff'
    })
  end
}
