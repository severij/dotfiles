return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  dependencies = {
    'mason-org/mason.nvim',
  },
  config = function()
    local jdtls = require 'jdtls'

    -- Get Mason paths directly
    local mason_path = vim.fn.stdpath('data') .. '/mason/packages'
    local jdtls_path = mason_path .. '/jdtls'
    local java_test_path = mason_path .. '/java-test'

    -- Check if jdtls is installed
    if vim.fn.isdirectory(jdtls_path) == 0 then
      vim.notify('jdtls not installed. Run :MasonInstall jdtls', vim.log.levels.WARN)
      return
    end

    -- Search paths for JDKs
    local jdk_search_paths = {
      '/usr/lib/jvm/java-*-openjdk*',
      '/usr/lib/jvm/java-*',
      vim.fn.expand('~/.sdkman/candidates/java/*'),
      vim.fn.expand('~/.asdf/installs/java/*'),
    }

    -- Extract Java version from path (handles java-17, java-1.17.0, java-21-openjdk, etc.)
    local function extract_java_version(path)
      -- Try java-XX-openjdk pattern first (e.g., java-17-openjdk-amd64)
      local version = path:match('java%-(%d%d+)%-')
      if version then return version end

      -- Try java-1.X.0 pattern (old naming, e.g., java-1.17.0-openjdk)
      version = path:match('java%-1%.(%d+)%.%d')
      if version then return version end

      -- Try just java-XX pattern
      version = path:match('java%-(%d%d+)')
      if version then return version end

      -- Try extracting version number at end of path (for sdkman/asdf)
      version = path:match('/(%d%d+)[^/]*$')
      if version then return version end

      return nil
    end

    -- Find Java 21+ for running jdtls (required by latest jdtls)
    local function find_java_21_or_higher()
      for _, pattern in ipairs(jdk_search_paths) do
        local paths = vim.fn.glob(pattern, false, true)
        for _, path in ipairs(paths) do
          local version = extract_java_version(path)
          if version and tonumber(version) >= 21 then
            local java_bin = path .. '/bin/java'
            if vim.fn.executable(java_bin) == 1 then
              return java_bin
            end
          end
        end
      end
      return 'java' -- fallback to system java
    end

    -- Auto-detect installed JDKs for project runtimes
    local function detect_runtimes()
      local runtimes = {}
      local seen = {}
      for _, pattern in ipairs(jdk_search_paths) do
        local paths = vim.fn.glob(pattern, false, true)
        for _, path in ipairs(paths) do
          -- Check if it's a valid JDK (has bin/java)
          if vim.fn.executable(path .. '/bin/java') == 1 and not seen[path] then
            seen[path] = true
            local version = extract_java_version(path)
            if version then
              local name = 'JavaSE-' .. version
              table.insert(runtimes, {
                name = name,
                path = path,
              })
            end
          end
        end
      end

      return runtimes
    end

    -- Get Java executable for running jdtls
    local java_cmd = find_java_21_or_higher()

    -- Get project name from root directory
    local function get_project_name()
      local root = vim.fs.root(0, { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' })
      if root then
        return vim.fn.fnamemodify(root, ':t')
      end
      return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    end

    -- Configure jdtls for the current buffer
    local function setup_jdtls()
      local root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' })

      if not root_dir then
        root_dir = vim.fn.getcwd()
      end

      local project_name = get_project_name()
      local workspace_dir = vim.fn.expand('~/.cache/jdtls-workspace/') .. project_name

      -- Find the launcher jar
      local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

      -- Determine OS config
      local os_config = 'config_linux'
      if vim.fn.has('mac') == 1 then
        os_config = 'config_mac'
      elseif vim.fn.has('win32') == 1 then
        os_config = 'config_win'
      end

      local config_dir = jdtls_path .. '/' .. os_config

      -- Build bundles for extensions (java-test)
      local bundles = {}
      if vim.fn.isdirectory(java_test_path) == 1 then
        local java_test_bundles = vim.fn.glob(java_test_path .. '/extension/server/*.jar', false, true)
        for _, bundle in ipairs(java_test_bundles) do
          table.insert(bundles, bundle)
        end
      end

      local config = {
        cmd = {
          java_cmd,
          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xmx1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens', 'java.base/java.util=ALL-UNNAMED',
          '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
          '-jar', launcher_jar,
          '-configuration', config_dir,
          '-data', workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {
            configuration = {
              runtimes = detect_runtimes(),
            },
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            references = {
              includeDecompiledSources = true,
            },
            format = {
              enabled = true,
            },
            signatureHelp = {
              enabled = true,
            },
            contentProvider = {
              preferred = 'fernflower',
            },
          },
        },
        init_options = {
          bundles = bundles,
        },
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        on_attach = function(_, bufnr)
          local opts = { buffer = bufnr }
          local wk = require 'which-key'

          wk.add({
            { '<Leader>j', group = 'Java', buffer = bufnr },
            { '<Leader>jo', jdtls.organize_imports, desc = 'Organize imports', buffer = bufnr },
            { '<Leader>jv', jdtls.extract_variable, desc = 'Extract variable', buffer = bufnr },
            { '<Leader>jc', jdtls.extract_constant, desc = 'Extract constant', buffer = bufnr },
            { '<Leader>jm', function()
              jdtls.extract_method(true)
            end, desc = 'Extract method', buffer = bufnr },
            { '<Leader>jt', group = 'Test', buffer = bufnr },
            { '<Leader>jtt', jdtls.test_nearest_method, desc = 'Run test at cursor', buffer = bufnr },
            { '<Leader>jtc', jdtls.test_class, desc = 'Run all tests in class', buffer = bufnr },
          })

          -- Visual mode mappings for extract refactorings
          wk.add({
            mode = 'v',
            { '<Leader>j', group = 'Java', buffer = bufnr },
            { '<Leader>jv', function()
              jdtls.extract_variable(true)
            end, desc = 'Extract variable', buffer = bufnr },
            { '<Leader>jc', function()
              jdtls.extract_constant(true)
            end, desc = 'Extract constant', buffer = bufnr },
            { '<Leader>jm', function()
              jdtls.extract_method(true)
            end, desc = 'Extract method', buffer = bufnr },
          })
        end,
      }

      jdtls.start_or_attach(config)
    end

    -- Set up autocmd to start jdtls when opening Java files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = setup_jdtls,
    })

    -- If we're already in a Java file, start immediately
    if vim.bo.filetype == 'java' then
      setup_jdtls()
    end
  end,
}
