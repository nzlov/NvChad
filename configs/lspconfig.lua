local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "pylsp",
  "jsonls",
  "volar",
  "graphql",
  "gopls",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      usePlaceholders = true,
    },
  }
end

local jdtls_home = require("mason-registry").get_package("jdtls"):get_install_path()
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

local root_files = {
  -- Multi-module projects
  { ".git", "build.gradle", "build.gradle.kts" },

  -- Single-module projects
  {
    "build.xml", -- Ant
    "pom.xml", -- Maven
    "settings.gradle", -- Gradle
    "settings.gradle.kts", -- Gradle
  },
}

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
lspconfig.jdtls.setup {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java", -- or '/path/to/java17_or_newer/bin/java'
    string.format("-javaagent:%s", jdtls_home .. "/lombok.jar"),
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "-Xms4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    launcher_jar,
    "-configuration",
    vim.fs.normalize(jdtls_home .. "/" .. get_config_dir()),
    "-data",
    vim.fn.expand "~/.cache/jdtls-workspace/" .. workspace_dir,
  },
  root_dir = function(fname)
    for _, patterns in ipairs(root_files) do
      local root = util.root_pattern(unpack(patterns))(fname)
      if root then
        return root
      end
    end
  end,
}
