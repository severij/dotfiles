return {
  'sindrets/diffview.nvim',
  config = function()
    require'diffview'.setup {
      default_args = {
        DiffviewOpen = { '--imply-local' },
      },
      view = {
        default = {
          layout = 'diff2_vertical'
        },
        merge_tool = {
          layout = 'diff3_vertical'
        },
        file_history = {
          layout = 'diff2_vertical'
        }
      }
    }
  end
}
