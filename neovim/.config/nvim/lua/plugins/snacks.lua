return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.config
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = true },
    terminal = { enabled = true },
    toggle = { enabled = true },
    zen = { enabled = true }
  },
  keys = {
    { "<C-c>", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>gh", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<C-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" }},
    { "<C-.>", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<C-,>", function() Snacks.scratch.select() end, desc = "Select Scratch Buffers"},
  }
}
