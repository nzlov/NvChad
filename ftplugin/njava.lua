vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.api.nvim_create_augroup("Java_Group", {})
local autocmd = vim.api.nvim_create_autocmd

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
        string.format("-javaagent:%s", jdtls_home .. "/lombok.jar"),
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
    require("lspconfig").jdtls.setup(config)
  end,
})

require("java").setup()
