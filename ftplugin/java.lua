vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*.java",
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

local start = false
local function handle_progress(_, result, context)
  local value = result.value
  if value.kind == "begin" and value.message == "Initialize Workspace" then
    start = true
  end
  if value.kind == "end" and value.message == "Building" and start then
    require("jdtls.dap").setup_dap_main_class_configs()
    start = false
  end
end
local function init()
  if vim.lsp.handlers["$/progress"] then
    -- There was already a handler, execute it too
    local old = vim.lsp.handlers["$/progress"]
    vim.lsp.handlers["$/progress"] = function(...)
      old(...)
      handle_progress(...)
    end
  else
    vim.lsp.handlers["$/progress"] = handle_progress
  end
end

autocmd("FileType", {
  pattern = "java",
  callback = function()
    local home = os.getenv "HOME"
    local jdtls_home = home .. "/.local/share/nvim/mason/packages/jdtls"
    local launcher_jar = vim.fn.glob(jdtls_home .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    local function get_config_dir()
      -- Unlike some other programming languages (e.g. JavaScript)
      -- lua considers 0 truthy!
      if vim.fn.has "linux" == 1 then
        return "config_linux"
      elseif vim.fn.has "mac" == 1 then
        return "config_mac"
      else
        return "config_win"
      end
    end

    -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    local config = {
      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      cmd = {

        -- 💀
        "java", -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.
        string.format(
          "-javaagent:%s",
          require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar"
        ),
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx2g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- 💀
        "-jar",
        launcher_jar,
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        -- 💀
        "-configuration",
        vim.fs.normalize(jdtls_home .. "/" .. get_config_dir()),
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.
        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        vim.fn.expand "~/.cache/jdtls-workspace/" .. workspace_dir,
      },

      -- 💀
      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        java = {},
      },

      -- Language server `initializationOptions`
      -- You need to extend the `bundles` with paths to jar files
      -- if you want to use additional eclipse.jdt.ls plugins.
      --
      -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
      --
      -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
      init_options = {
        bundles = {
          vim.fn.glob(
            home
              .. "/workspaces/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
            1
          ),
        },
      },
    }
    require("jdtls").start_or_attach(config)
    init()
  end,
})
