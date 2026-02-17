local M = {}

-- Define dependencies to check
local dependencies = {
  { cmd = "fd", desc = "Fast file finder (used by fzf-lua)" },
  { cmd = "rg", desc = "Fast grep alternative (used by fzf-lua)" },
  { cmd = "fzf", desc = "Fuzzy finder CLI (used by fzf-lua)" }
}

function M.check_dependencies()
  local missing = {}
  
  -- Check each dependency
  for _, dep in ipairs(dependencies) do
    if vim.fn.executable(dep.cmd) == 0 then
      table.insert(missing, dep)
    end
  end
  
  -- Show notification if any dependencies are missing
  if #missing > 0 then
    local lines = { "Missing recommended dependencies:\n" }
    
    for _, dep in ipairs(missing) do
      table.insert(lines, string.format("  • %s - %s", dep.cmd, dep.desc))
    end
    
    vim.notify(table.concat(lines, "\n"), vim.log.levels.WARN, { title = "Neovim Health Check" })
  end
end

return M
