local telescope = require('telescope')

telescope.setup {
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2
    }
  }
}

telescope.load_extension('fzy_native')
